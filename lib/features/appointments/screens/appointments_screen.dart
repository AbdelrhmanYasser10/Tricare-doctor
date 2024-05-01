import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tricares_doctor_app/core/globle/color/light_app_color.dart';
import 'package:tricares_doctor_app/core/globle/color/shared_color.dart';
import 'package:tricares_doctor_app/features/appointments/screens/widgets/list_of_available_days.dart';
import 'package:tricares_doctor_app/features/appointments/screens/widgets/title_sub_widget.dart';

class AppointmentsScreen extends StatefulWidget {
  const AppointmentsScreen({Key? key}) : super(key: key);

  @override
  State<AppointmentsScreen> createState() => _AppointmentsScreenState();
}

class _AppointmentsScreenState extends State<AppointmentsScreen> {



  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text(
          "Manage Appointments",
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TitleSubTitleWidget(
              title: "Set your appointments",
              subtitle: "The following details will be shown for patients",
            ),
            verticalSpace(
              height: 20.0
            ),
            const TitleSubTitleWidget(
              title: "Opening Hours",
              subtitle: "Select Working days",
            ),
            verticalSpace(height: 10.0,),
            const ListOfAvailableDays(),
          ],
        ),
      ),
    );
  }

  SizedBox verticalSpace({required double height})=>SizedBox(
    height: height,
  );
}
