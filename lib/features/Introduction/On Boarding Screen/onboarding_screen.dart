import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:tricares_doctor_app/features/Introduction/On%20Boarding%20Screen/widgets/page_view_widget.dart';

import '../../../core/functions/fucntions.dart';
import '../../../core/globle/color/shared_color.dart';
import '../../../core/network/Local/CashHelper.dart';
import '../../home_layout/screens/home_layout.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  PageController boardController = PageController();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
        body: Stack(
      children: [
        BuildPageViewWidget(boardController: boardController),
        Container(
          margin: EdgeInsets.only(top: height * 0.55),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SmoothPageIndicator(
                controller: boardController,
                count: 3,
                effect: const ExpandingDotsEffect(
                  activeDotColor: AppColor.primaryColor,
                  dotHeight: 12,
                  dotWidth: 12,
                  spacing: 5,
                  expansionFactor: 4,
                ),
              ),
            ],
          ),
        ),
        SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: height * 0.01),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {
                    CashHelper.prefs.setBool('passOnBoarding', true);
                    navigateTo(context, const HomeLayoutScreen());
                  },
                  child:  Text(
                    'Skip',
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    ));
  }
}
