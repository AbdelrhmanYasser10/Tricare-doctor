import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:tricares_doctor_app/core/network/Local/CashHelper.dart';
import 'package:tricares_doctor_app/core/network/Remote/DioHelper.dart';
import 'package:tricares_doctor_app/features/sessions/models/sessions_model.dart';
import 'package:tricares_doctor_app/features/sessions/screens/widgets/session_card.dart';

import '../../../../core/component/Loading Widget/loading_widget.dart';
import '../../../../core/component/MessageWidget/message_widget.dart';
import '../../../../core/component/SVG/svg.dart';
import '../../../../core/globle/color/shared_color.dart';
import '../../../../core/network/endPoind.dart';
import '../../../../generated/l10n.dart';

class SessionsBodyWidget extends StatefulWidget {
  final String filterString;
  const SessionsBodyWidget({Key? key , required this.filterString}) : super(key: key);

  @override
  State<SessionsBodyWidget> createState() => _SessionsBodyWidgetState();
}

class _SessionsBodyWidgetState extends State<SessionsBodyWidget> {

  final PagingController<int, Sessions> _pagingController =
  PagingController(firstPageKey: 0);
  int pageNumber = 1;
  bool hasError = false;
  String message = '';
  @override
  void initState() {
    _pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
    super.initState();
  }

  Future<void> _fetchPage(int pageKey) async {
    try {
      final newItems = await DioHelper.postData(
        data: {
          'page':pageNumber,
          'section' : widget.filterString,
        },
        url: EndPoints.sessions,
        token: CashHelper.prefs.getString('token')??""
      );
      final SessionsModel sessionsModel = SessionsModel.fromJson(newItems.data);
      if(!sessionsModel.hasError!) {
        final isLastPage = sessionsModel.data!.pageCurrent ==  sessionsModel.data!.pageMax;
        if (isLastPage) {
          _pagingController.appendLastPage(sessionsModel.data!.sessions!);
        } else {
          final nextPageKey = pageKey + sessionsModel.data!.sessions!.length;
          pageNumber++;
          _pagingController.appendPage(sessionsModel.data!.sessions!, nextPageKey);
        }
      }
      else{
        setState(() {
          hasError = true;
          message = sessionsModel.errors!.join(' ');
        });
      }
    } catch (error) {
      print(error.toString());
      _pagingController.error = error;
    }
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.only(
          right: width * 0.02,
          left: width * 0.02,
          top: height *0.02
      ),
      child: !hasError ? PagedListView<int, Sessions>(
        pagingController: _pagingController,
        physics: const BouncingScrollPhysics(),
        builderDelegate: PagedChildBuilderDelegate<Sessions>(
          itemBuilder: (context, item, index) => Padding(
            padding:  EdgeInsets.symmetric(
                vertical: height * 0.011
            ),
            child: SessionCard(
              session: item,
            ),
          ),
          transitionDuration: const Duration(milliseconds: 900),
          animateTransitions: true,
          firstPageProgressIndicatorBuilder: (context) {
            return const BuildLoadingWidget();
          },
          newPageProgressIndicatorBuilder: (context) {
            return const BuildLoadingWidget();
          },
        ),
      ) : MessageWidget(
        width: width,
        height: height / 3,
        heightImage: height / 3,
        widthImage: width / 3,
        imagePath: 'assets/icons/error.svg',
        message: message,
        clickBtn: () {
          _pagingController.refresh();
        },
        btnText: S.of(context).reload,
      ),
    );
  }
}

