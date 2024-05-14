import 'package:flutter/material.dart';



class BuildContainer extends StatelessWidget {
  final double height;
  double? width;
  double? radius;
  BuildContainer({super.key, required this.height,this.width,this.radius});
  @override
  Widget build(BuildContext context) {
    var sizeWidth = MediaQuery.of(context).size.height;
    return Container(
        margin: EdgeInsets.symmetric(vertical: 5),
        width: width?? sizeWidth,
        height: height,
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(radius??12),
        ),
      );

  }
}