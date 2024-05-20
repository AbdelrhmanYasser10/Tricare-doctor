import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:tricares_doctor_app/features/Rooms/models/rooms_model.dart';
import 'package:tricares_doctor_app/features/Rooms/screens/widgets/room_card_widget.dart';

import '../../../../core/network/Local/CashHelper.dart';
import '../../../../core/network/Remote/DioHelper.dart';
import '../../../../core/network/endPoind.dart';

class RoomScreensPaginationConsumer extends StatefulWidget {
  const RoomScreensPaginationConsumer({Key? key}) : super(key: key);

  @override
  State<RoomScreensPaginationConsumer> createState() => _RoomScreensPaginationConsumerState();
}

class _RoomScreensPaginationConsumerState extends State<RoomScreensPaginationConsumer> {
  final PagingController<int, Rooms> _pagingController =
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
          url: EndPoints.rooms,
          token: CashHelper.prefs.getString('token')??""
      );
      final RoomsModel roomsModel = RoomsModel.fromJson(newItems.data);
      if(!roomsModel.hasError!) {
        final isLastPage = roomsModel.data!.pageCurrent ==  roomsModel.data!.pageMax;
        if (isLastPage) {
          _pagingController.appendLastPage(roomsModel.data!.rooms!);
        } else {
          final nextPageKey = pageKey + roomsModel.data!.rooms!.length;
          pageNumber++;
          _pagingController.appendPage(roomsModel.data!.rooms!, nextPageKey);
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
      child: PagedListView<int, Rooms>(
        pagingController: _pagingController,
        physics: const BouncingScrollPhysics(),
        builderDelegate: PagedChildBuilderDelegate<Rooms>(
          itemBuilder: (context, item, index) => Padding(
            padding:  EdgeInsets.symmetric(
                vertical: height * 0.011
            ),
            child: RoomCard(
              room: item,
            ),
          ),
          transitionDuration: const Duration(milliseconds: 900),
          animateTransitions: true,

        ),
      ),
    );
  }
}
