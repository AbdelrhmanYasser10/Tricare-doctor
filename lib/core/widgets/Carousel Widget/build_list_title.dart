
import 'package:flutter/material.dart';

import '../../component/SVG/svg.dart';
import '../../globle/color/dark_app_color.dart';
import '../../globle/color/shared_color.dart';



class BuildListTitle extends StatelessWidget {

  final String text;
  final  String iconName;
  void Function()? function;
  double? size;
  Color? color;
  Color? textColor;



   BuildListTitle({required this.text,required this.iconName,required this.function,this.size,this.color,this.textColor}) ;

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
      trailing:   Icon(Icons.arrow_forward_ios,color: color?? AppColor.primaryColor,),
      leading: CircleAvatar(
        backgroundColor: DarkAppColor.foreGroundColors,
          child: BuildIconSvg(
            name: iconName,
            size: size??20,
            color: color?? AppColor.primaryColor,
          ),
      ),
    );
  }
}
