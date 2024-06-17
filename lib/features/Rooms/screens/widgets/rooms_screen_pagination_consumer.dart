import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:tricares_doctor_app/core/Global%20Cubit/global_cubit.dart';
import 'package:tricares_doctor_app/features/Rooms/models/rooms_model.dart';
import 'package:tricares_doctor_app/features/Rooms/screens/widgets/room_card_widget.dart';

import '../../../../core/component/Loading Widget/loading_widget.dart';
import '../../../../core/component/MessageWidget/message_widget.dart';
import '../../../../core/network/Local/CashHelper.dart';
import '../../../../core/network/Remote/DioHelper.dart';
import '../../../../core/network/endPoind.dart';
import '../../../../generated/l10n.dart';

class RoomScreensPaginationConsumer extends StatefulWidget {
  const RoomScreensPaginationConsumer({Key? key}) : super(key: key);

  @override
  State<RoomScreensPaginationConsumer> createState() =>
      _RoomScreensPaginationConsumerState();
}

class _RoomScreensPaginationConsumerState
    extends State<RoomScreensPaginationConsumer> {
  final PagingController<int, Rooms> _pagingController =
      PagingController(firstPageKey: 0);
  int pageNumber = 1;
  bool hasError = false;
  bool isEmpty = false;
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
            'page': pageNumber,
          },
          url: EndPoints.rooms,
          token: CashHelper.prefs.getString('token') ?? "");
      final RoomsModel roomsModel = RoomsModel.fromJson(newItems.data);
      if(pageNumber ==  1 && roomsModel.data == null){
        setState(() {
          isEmpty = true;
          message = roomsModel.errors!.join(' ');
        });
      }
      else {
        if (!roomsModel.hasError!) {
          final isLastPage =
              roomsModel.data!.pageCurrent == roomsModel.data!.pageMax;
          if (isLastPage) {
            _pagingController.appendLastPage(roomsModel.data!.rooms!);
          } else {
            final nextPageKey = pageKey + roomsModel.data!.rooms!.length;
            pageNumber++;
            _pagingController.appendPage(roomsModel.data!.rooms!, nextPageKey);
          }
        } else {
          setState(() {
            hasError = true;
            message = roomsModel.errors!.join(' ');
          });
        }
      }
    } catch (error) {
      setState(() {
        hasError = true;
        message = "";
      });
      _pagingController.error = error;
    }
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.only(
          right: width * 0.02, left: width * 0.02, top: height * 0.02),
      child: BlocConsumer<GlobalCubit, GlobalState>(
        listener: (context, state) {
         setState(() {
           pageNumber = 1;
          _pagingController.refresh();
         });
        },
        builder: (context, state) {
          return isEmpty ?MessageWidget(
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
          ) : hasError ? MessageWidget(
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
          ):PagedListView<int, Rooms>(
            pagingController: _pagingController,
            physics: const BouncingScrollPhysics(),
            builderDelegate: PagedChildBuilderDelegate<Rooms>(
              itemBuilder: (context, item, index) => Padding(
                padding: EdgeInsets.symmetric(vertical: height * 0.011),
                child: RoomCard(
                  room: item,
                ),
              ),
              transitionDuration: const Duration(milliseconds: 900),
              animateTransitions: true,
              newPageErrorIndicatorBuilder: (context) {
                return MessageWidget(
                  width: width / 3,
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
                  width: width / 3,
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
              firstPageProgressIndicatorBuilder: (context) {
                return const BuildLoadingWidget();
              },
              newPageProgressIndicatorBuilder: (context) {
                return const BuildLoadingWidget();
              },
            ),
          );
        },
      ),
    );
  }
}
