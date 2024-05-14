import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:tricares_doctor_app/core/widgets/Login%20First/login_first_widget.dart';
import 'package:tricares_doctor_app/features/sessions/screens/widgets/page_view_shape.dart';
import 'package:tricares_doctor_app/features/sessions/screens/widgets/tab_shape.dart';

import '../../../core/network/Local/CashHelper.dart';


class SessionsScreen extends StatelessWidget {
  final bool fromHome;
  const SessionsScreen({Key? key , required this.fromHome}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: fromHome ? AppBar(
        title: const Text(
          "Your Examinations",
        ),
        centerTitle: true,
      ):null,
      body: CashHelper.getData(key: 'login') == null
          ? BuildLoginFirst(
        width: width,
        height: height,
        heightImage: width,
        widthImage: width,
      ): Padding(
        padding: EdgeInsets.symmetric(
            horizontal: width * 0.02
        ),
        child: const Column(
          children: [
            TabShape(),
            Expanded(
              child: PageViewShape(),
            ),
          ],
        ),
      ),
    );
  }
}
