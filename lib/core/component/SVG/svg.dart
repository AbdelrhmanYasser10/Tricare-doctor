import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BuildIconSvg extends StatelessWidget {
  final String name;
  final double size;
  final Color? color;
  const BuildIconSvg({Key? key,required this.name,this.size =30,this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'assets/icons/${name}',
      width: size,
      color: color??Colors.grey.shade600,

      //semanticsLabel: 'A red up arrow'
    );
  }
}
