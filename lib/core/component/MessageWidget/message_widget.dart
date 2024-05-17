import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MessageWidget extends StatelessWidget {
  final double heightImage;
  final double widthImage;
  final double height;
  final double width;
  final String message;
  final String imagePath;
  final VoidCallback clickBtn;
  final String btnText;
  const MessageWidget({
    Key? key,
    required this.width,
    required this.height,
    required this.heightImage,
    required this.widthImage,
    required this.imagePath,
    required this.message,
    required this.clickBtn,
    required this.btnText,
  }) : super(key: key);

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
              child: SvgPicture.asset(imagePath),
            ),


            Text(
              message,
              style: Theme.of(context).textTheme.titleMedium,

            ),

            SizedBox(height: height*0.01,),

            SizedBox(
              width: width,
              child: ElevatedButton(
                onPressed: clickBtn,
                child: Text(btnText),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
