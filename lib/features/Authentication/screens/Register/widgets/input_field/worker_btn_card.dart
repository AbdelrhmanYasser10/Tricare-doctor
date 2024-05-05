import 'package:flutter/material.dart';

import '../../../../../../core/component/SVG/svg.dart';
import '../../../../../../core/globle/color/light_app_color.dart';
import '../../../../../../core/globle/color/shared_color.dart';

class WorkerButtonCard extends StatelessWidget {
  final String icon;
  final String title;
  final bool active;
  final VoidCallback onTap;
  const WorkerButtonCard({Key? key ,
    required this.title,required this.active,required this.icon,required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: active ?
          AppColor.primaryColor:
          LightAppColor.foreGroundColors,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            BuildIconSvg(
              name: icon,
              color: active ?
              Colors.white:
              LightAppColor.textColor,
              size: height * 0.1,
            ),
            Text(
              title,
              style:
              Theme.of(context).textTheme.
              titleMedium!.copyWith(
                color: active ?
                Colors.white:
                LightAppColor.textColor,
              ),
            )
          ],
        ),
      ),
    );
  }
}
