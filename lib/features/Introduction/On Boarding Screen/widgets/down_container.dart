import 'package:flutter/material.dart';
import 'package:tricares_doctor_app/features/Authentication/screens/Login/login_screen.dart';
import 'package:tricares_doctor_app/features/Authentication/screens/Register/register_screen.dart';

import '../../../../core/component/ElevatedButton Widget/build_elevated_button.dart';
import '../../../../core/functions/fucntions.dart';
import '../../../../core/network/Local/CashHelper.dart';
import '../../../home_layout/screens/home_layout.dart';

class BuildDownContainer extends StatelessWidget {
  final String title;
  final String description;

  const BuildDownContainer({super.key, required this.title, required this.description});


  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return  Container(
      width: double.infinity,
      height: double.infinity,
      margin: EdgeInsets.only(top: height * 0.6),
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          )),
      child: Padding(
        padding: EdgeInsets.only(
            left: width * 0.06,
            right: width * 0.06,
            top: height * 0.03),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            SizedBox(
              height: height * 0.02,
            ),
            Text(
              description,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            SizedBox(
              height: height * 0.04,
            ),
            BuildButton(
              text: 'Become a partner',
              onPressed: () {
                CashHelper.prefs.setBool('passOnBoarding', true);
                navigateTo(context, const RegisterScreen());
              },
            ),
            SizedBox(
              height: height * 0.01,
            ),
            SizedBox(
              width: width,
              child: OutlinedButton(
                onPressed: () {
                  CashHelper.prefs.setBool('passOnBoarding', true);
                  navigateToToFinish(context, const HomeLayoutScreen());
                },
                style: OutlinedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text('Enter As Gust'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
