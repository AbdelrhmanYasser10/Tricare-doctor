
import 'package:flutter/material.dart';

import '../../component/SVG/svg.dart';
import '../../globle/color/dark_app_color.dart';


class BuildListTitle extends StatelessWidget {
  final String text;
  final  String iconName;
  final void Function()? function;
  final double? size;
  final Color? color;
  final Color? textColor;



   const BuildListTitle({required this.text,required this.iconName,required this.function,this.size,this.color,this.textColor,super.key}) ;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: function,
      title: Text(
          text,
         style: Theme.of(context).textTheme.titleMedium!.copyWith(
           color: textColor,
         ),
      ),
      trailing:   Icon(Icons.arrow_forward_ios,color: color?? DarkAppColor.primaryColor,),
      leading: CircleAvatar(
        backgroundColor: DarkAppColor.foreGroundColors,
          child: BuildIconSvg(
            name: iconName,
            size: size??20,
            color: color??DarkAppColor.primaryColor,
          ),
      ),
    );
  }
}
