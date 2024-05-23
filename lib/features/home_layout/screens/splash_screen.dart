import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:tricares_doctor_app/core/globle/color/light_app_color.dart';
import '../../../../core/functions/fucntions.dart';
import '../../../core/globle/color/shared_color.dart';
import '../../../core/network/Local/CashHelper.dart';
import '../../Introduction/On Boarding Screen/onboarding_screen.dart';
import 'home_layout.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  AnimationController? _animationController;
  Animation<double>? _animation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );

    _animation = CurvedAnimation(
      parent: _animationController!,
      curve: Curves.ease,
    );

    _animationController!.addListener(() {
      if (_animationController!.isCompleted) {
        //    navigateToToFinish(context, widget.FirstScreen);
        Widget w  = CashHelper.prefs.getBool('passOnBoarding') == null ? const OnBoardingScreen() : const HomeLayoutScreen();
        navigateToToFinish(context, w);
      }
    });

    _animationController!.forward();
  }

  @override
  void dispose() {
    _animationController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: LightAppColor.backgroundColor,
      body: Center(
        child: AnimatedBuilder(
          animation: _animationController!,
          builder: (context, child) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Hero(
                  tag: 'logo',
                  child: Image.asset(
                    'assets/images/logo.png',
                    width: _animation!.value * width * 0.7,
                    height: _animation!.value * width * 0.7,
                  ),
                ),

                Text(
                  'TriCare Partners',
                  style: Theme.of(context)
                      .textTheme
                      .headlineLarge!
                      .copyWith(color: AppColor.primaryColor),
                ).animate().fadeIn()
                    .then(delay: 1500.ms) // baseline=800ms
                    .fade(),
              ],
            );
          },
        ),
      ),
    );
  }
}
