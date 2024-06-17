import 'package:flutter/material.dart';
import 'package:tricares_doctor_app/core/functions/fucntions.dart';
import 'package:tricares_doctor_app/core/globle/color/light_app_color.dart';
import 'package:tricares_doctor_app/features/sessions/models/sessions_model.dart';
import 'package:tricares_doctor_app/features/sessions/screens/session_details_screen.dart';

import '../../../../core/globle/color/shared_color.dart';
import '../../../../generated/l10n.dart';

class SessionCard extends StatelessWidget {
  final Sessions session;
  const SessionCard({Key? key , required this.session}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: (){
        navigateTo(context, SessionDetailsScreen(sessionId: int.parse(session.sESSIONID!)));
      },
      child: Container(
        height: height * 0.21,
        padding:  EdgeInsets.symmetric(
          horizontal: width * 0.02,
          vertical: height *0.02,
        ),
        decoration: BoxDecoration(
          color: LightAppColor.foreGroundColors,
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              children: [
      
                SizedBox(
                  width: width * 0.02,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        session.patientFullname!,
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: width * 0.025,
                    vertical:  height * 0.0145,
                  ),
                  decoration: BoxDecoration(
                    color: AppColor.primaryColor,
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Text(
                    session.status!,
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(
                  width: width * 0.02,
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.symmetric(
                  horizontal: width * 0.03,
                  vertical: height * 0.021
              ),
              decoration: BoxDecoration(
                color: AppColor.primaryColor,
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.date_range,
                        color: Colors.white,
                        size: 25.0,
                      ),
                      SizedBox(
                        width: width * 0.03,
                      ),
                      Text(
                        session.sessionDateDisplay!,
                        style: Theme.of(context).textTheme.labelLarge!.copyWith(
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    width: width * 0.02,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.access_time_outlined,
                        color: Colors.white,
                        size: 25.0,
                      ),
                      SizedBox(
                        width: width * 0.03,
                      ),
                      Text(
                        session.sessionStartDisplay!,
                        style: Theme.of(context).textTheme.labelLarge!.copyWith(
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
