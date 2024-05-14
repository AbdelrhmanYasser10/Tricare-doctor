import 'package:flutter/material.dart';

import '../../../features/Authentication/screens/Login/login_screen.dart';
import '../../functions/fucntions.dart';



class BuildLoginFirst extends StatelessWidget {
  final double heightImage;
  final double widthImage;
  final double height;
  final double width;

  const BuildLoginFirst({super.key, required this.heightImage, required this.widthImage, required this.height, required this.width});



  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding:  EdgeInsets.symmetric(horizontal: width*0.03),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: heightImage,
              width: widthImage,
              child: Image.asset('assets/images/login.png'),
            ),


            Text(
              'Login or Create An Account First',
              style: Theme.of(context).textTheme.titleMedium,

            ),

            SizedBox(height: height*0.01,),

            SizedBox(
              width: width,
              child: ElevatedButton(
                onPressed: (){
                  navigateTo(context, LoginScreen());
                },
                child: Text('Login'),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
