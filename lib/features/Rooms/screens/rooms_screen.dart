import 'package:flutter/material.dart';
import 'package:tricares_doctor_app/features/Drawer/screen/drawer_screen.dart';
import 'package:tricares_doctor_app/features/Rooms/screens/widgets/rooms_screen_pagination_consumer.dart';

import '../../../generated/l10n.dart';


class RoomsScreen extends StatelessWidget {
  const RoomsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      drawer: const DrawerScreen(
        isFromHome: false,
      ),
      appBar: AppBar(
        title:  Text(
          S.of(context).myRooms,
        ),
        centerTitle: true,
      ),
      body:const  RoomScreensPaginationConsumer(),
    );
  }
}
