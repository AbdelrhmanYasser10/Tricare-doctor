import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Global Cubit/global_cubit.dart';
import '../../component/Network Image/network_image.dart';
import '../../functions/fucntions.dart';
import '../../globle/color/dark_app_color.dart';
import '../../globle/color/light_app_color.dart';

class BuildProductItem extends StatelessWidget {





  final String image;
  final String name;
  final String description;

  const BuildProductItem({

    required this.name,
    required this.image,
    required this.description,
});



  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Card(
      margin: EdgeInsets.zero,

      // decoration: BoxDecoration(
      //   color: context.read<GlobalCubit>().isLight? LightAppColor.foreGroundColors:
      //   DarkAppColor.foreGroundColors,
      //   borderRadius: BorderRadius.circular(5),
      // ),
      child: Column(
        children: [
          AspectRatio(
            aspectRatio: 16/9,
            child: BuildImage(
              image: image,
              fit: BoxFit.cover,
              radius: 5.0,
              borderAll: false,
            ),
          ),
          Expanded(
            child: Padding(
              padding:  EdgeInsets.symmetric(vertical: height*0.01,horizontal: width*0.01),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Expanded(
                   flex: 1,
                    child: Text(
                      name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                  ),

                  SizedBox(height: height*0.01,),

                  Expanded(
                    flex: 3,
                    child: Text(
                      cleanHtmlToPlainText(description,maxLength: 200),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: Colors.grey,
                      ),
                    ),
                  ),

                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
