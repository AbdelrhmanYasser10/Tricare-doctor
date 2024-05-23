import 'package:flutter/material.dart';
import 'package:tricares_doctor_app/features/Drawer/screen/drawer_screen.dart';
import 'package:tricares_doctor_app/features/Rooms/screens/widgets/rooms_screen_pagination_consumer.dart';


class RoomsScreen extends StatelessWidget {
  const RoomsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      drawer: const DrawerScreen(
        isFromHome: false,
      ),
      appBar: AppBar(
        title: const Text(
          "Your Rooms",
        ),
        centerTitle: true,
      ),
      body:const  RoomScreensPaginationConsumer(),
    );
  }
}
