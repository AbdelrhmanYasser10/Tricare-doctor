import 'package:flutter/material.dart';

class NoInternetWidget extends StatelessWidget {
  final  void Function()? onPressed;

  const NoInternetWidget({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery
        .of(context)
        .size
        .height;
    var width = MediaQuery
        .of(context)
        .size
        .width;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [

        Image.asset('assets/images/error.png'),
        SizedBox(height: height*0.02,),
        TextButton(
          onPressed: onPressed,
          child: Text('Retry'),
        ),

      ],
    );
  }
}
