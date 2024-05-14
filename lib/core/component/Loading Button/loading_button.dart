import 'package:flutter/material.dart';
import 'package:loading_btn/loading_btn.dart';

import '../../globle/color/shared_color.dart';

class LoadingButton extends StatelessWidget {
  final  dynamic Function(Function, Function, ButtonState)? onTap;
  final String text;

  const LoadingButton({
    required this.onTap,
    required this.text,
});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Center(
      child: LoadingBtn(
        height: height * 0.06,
        borderRadius: 120,
        animate: true,
        color: AppColor.primaryColor,
        width: width,
        loader: Container(
          padding: const EdgeInsets.all(15),
          width: 50,
          height: 50,
          child: const CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
          ),
        ),
        child:  Text(text),
        onTap: onTap,
       // },
      ),
    );
  }
}
