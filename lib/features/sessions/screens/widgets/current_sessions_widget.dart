import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:tricares_doctor_app/core/network/Local/CashHelper.dart';
import 'package:tricares_doctor_app/core/network/Remote/DioHelper.dart';
import 'package:tricares_doctor_app/features/sessions/models/sessions_model.dart';
import 'package:tricares_doctor_app/features/sessions/screens/widgets/session_card.dart';

import '../../../../core/component/Loading Widget/loading_widget.dart';
import '../../../../core/component/MessageWidget/message_widget.dart';

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
  bool isEmpty = false;

  @override
  void initState() {
    _pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
    super.initState();
  }

  Future<void> _fetchPage(int pageKey) async {
    if(kDebugMode){
      print(widget.filterString);
    }
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
      if(pageNumber == 1 && sessionsModel.data == null){
        setState(() {
          isEmpty = true;
          message = sessionsModel.errors!.join(' ');
        });
      }
      else {
        if (!sessionsModel.hasError!) {
          final isLastPage = sessionsModel.data!.pageCurrent ==
              sessionsModel.data!.pageMax;
          if (isLastPage) {
            _pagingController.appendLastPage(sessionsModel.data!.sessions!);
          } else {
            final nextPageKey = pageKey + sessionsModel.data!.sessions!.length;
            pageNumber++;
            _pagingController.appendPage(
                sessionsModel.data!.sessions!, nextPageKey);
          }
        }
        else {
          setState(() {
            hasError = true;
            message = sessionsModel.errors!.join(' ');
            if(kDebugMode){
              print(message);
            }
          });
        }
      }
    } catch (error) {
      setState(() {
        hasError = true;
      });
      if(kDebugMode){
        print(error);
      }
      _pagingController.error = error;
    }
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return RefreshIndicator(
      onRefresh: () => Future(() {
        pageNumber = 1;
        _pagingController.refresh();
      }),
      child: Padding(
        padding: EdgeInsets.only(
            right: width * 0.02,
            left: width * 0.02,
            top: height *0.02
        ),
        child: hasError ? MessageWidget(
          width: width,
          height: height / 3,
          heightImage: height / 3,
          widthImage: width / 3,
          imagePath: 'assets/icons/error.svg',
          message: message == "" ? S.of(context).errorHappenedUnExpected:message,
          clickBtn: () {
            setState(() {
              pageNumber = 1;
              hasError = false;
              isEmpty = false;
              _pagingController.refresh();

            });
          },
          btnText: S.of(context).reload,
        ):isEmpty ? MessageWidget(
          width: width,
          height: height / 3,
          heightImage: height / 3,
          widthImage: width / 3,
          imagePath: 'assets/icons/empty.svg',
          message:message,
          clickBtn: () {
            setState(() {
              pageNumber = 1;
              hasError = false;
              isEmpty = false;
              _pagingController.refresh();

            });
          },
          btnText: S.of(context).reload,
        ): PagedListView<int, Sessions>(
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
            newPageErrorIndicatorBuilder: (context) {
              return MessageWidget(
                width: width,
                height: height / 3,
                heightImage: height / 3,
                widthImage: width / 3,
                imagePath: 'assets/icons/error.svg',
                message: S.of(context).errorHappenedUnExpected,
                clickBtn: () {
                  setState(() {
                    pageNumber = 1;
                    hasError = false;
                    isEmpty = false;
                    _pagingController.refresh();

                  });
                },
                btnText: S.of(context).reload,
              );
            },
            firstPageErrorIndicatorBuilder: (context) {
              return MessageWidget(
                width: width ,
                height: height / 3,
                heightImage: height / 3,
                widthImage: width / 3,
                imagePath: 'assets/icons/error.svg',
                message: S.of(context).errorHappenedUnExpected,
                clickBtn: () {
                  setState(() {
                    pageNumber = 1;
                    hasError = false;
                    isEmpty = false;
                    _pagingController.refresh();

                  });
                },
                btnText: S.of(context).reload,
              );
            },
            transitionDuration: const Duration(milliseconds: 900),
            animateTransitions: true,
            firstPageProgressIndicatorBuilder: (context) {
              return const BuildLoadingWidget();
            },
            newPageProgressIndicatorBuilder: (context) {
              return const BuildLoadingWidget();
            },
          ),
        ) ,
      ),
    );
  }
}

