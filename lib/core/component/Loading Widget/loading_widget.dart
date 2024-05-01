import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';


import '../../globle/color/shared_color.dart';

class BuildLoadingWidget extends StatelessWidget {
  const BuildLoadingWidget({super.key,this.size =50});

  final double size;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: LoadingAnimationWidget.inkDrop(
        color: AppColor.primaryColor,
        size: size,
      ),
    );
  }
}


