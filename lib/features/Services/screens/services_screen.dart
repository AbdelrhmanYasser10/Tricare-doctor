import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:tricares_doctor_app/features/Services/screens/widgets/service_card.dart';

import '../../../core/component/Loading Widget/loading_widget.dart';
import '../../../core/network/Remote/DioHelper.dart';
import '../../../core/network/endPoind.dart';
import '../models/services_model.dart';


class ServiceScreen extends StatefulWidget {
  const ServiceScreen({Key? key}) : super(key: key);

  @override
  State<ServiceScreen> createState() => _ServiceScreenState();
}

class _ServiceScreenState extends State<ServiceScreen> {

  final PagingController<int, Services> _pagingController =
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
      final newItems = await DioHelper.getData(
          query: {
            'page':pageNumber,
          },
          url: EndPoints.service,
      );
      final ServicesModel servicesModel = ServicesModel.fromJson(newItems.data);
      if(!servicesModel.hasError!) {
        final isLastPage = servicesModel.data!.pageCurrent ==  servicesModel.data!.pageMax;

        if (isLastPage) {

          _pagingController.appendLastPage(servicesModel.data!.services!);

        } else {

          final nextPageKey = pageKey + servicesModel.data!.services!.length;
          pageNumber++;
          _pagingController.appendPage(servicesModel.data!.services!, nextPageKey);
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
      child: PagedListView<int, Services>(

        pagingController: _pagingController,
        physics: const BouncingScrollPhysics(),
        builderDelegate: PagedChildBuilderDelegate<Services>(
          itemBuilder: (context, item, index) => Padding(
            padding:  EdgeInsets.symmetric(
                vertical: height * 0.01,
            ),
            child: ServiceCard(
              service: item,
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

