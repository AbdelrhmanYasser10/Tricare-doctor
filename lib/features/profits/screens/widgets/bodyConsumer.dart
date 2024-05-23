import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:tricares_doctor_app/core/component/Loading%20Widget/loading_widget.dart';
import 'package:tricares_doctor_app/features/profits/screens/widgets/profit_card.dart';
import '../../../../core/network/Local/CashHelper.dart';
import '../../../../core/network/Remote/DioHelper.dart';
import '../../../../core/network/endPoind.dart';
import '../../models/profits_model.dart';


class ProfitsBodyConsumer extends StatefulWidget {
  const ProfitsBodyConsumer({Key? key}) : super(key: key);

  @override
  State<ProfitsBodyConsumer> createState() => _ProfitsBodyConsumerState();
}

class _ProfitsBodyConsumerState extends State<ProfitsBodyConsumer> {
  final PagingController<int, PartnersOrders> _pagingController =
  PagingController(firstPageKey: 0);
  int pageNumber = 1;

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
          },
          url: EndPoints.profitsTable,
          token: CashHelper.prefs.getString('token')??""
      );
      final ProfitsModel proftiModel = ProfitsModel.fromJson(newItems.data);
      if(!proftiModel.hasError!) {
        final isLastPage = proftiModel.data!.pageCurrent ==  proftiModel.data!.pageMax;
        if (isLastPage) {
          _pagingController.appendLastPage(proftiModel.data!.partnersOrders!);
        } else {
          final nextPageKey = pageKey + proftiModel.data!.partnersOrders!.length;
          pageNumber++;
          _pagingController.appendPage(proftiModel.data!.partnersOrders!, nextPageKey);
        }
      }
      else{

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
      child: PagedListView<int, PartnersOrders>(
        pagingController: _pagingController,
        physics: const BouncingScrollPhysics(),
        builderDelegate: PagedChildBuilderDelegate<PartnersOrders>(
          itemBuilder: (context, item, index) => Padding(
            padding:  EdgeInsets.symmetric(
                vertical: height * 0.009
            ),
            child: ProfitCard(
              profit: item,
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
      ),
    );
  }
}
