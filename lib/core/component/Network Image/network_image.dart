import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';


import '../Loading Widget/loading_widget.dart';

class BuildImage extends StatelessWidget {
   const BuildImage({super.key,this.errorWidget,required this.image,this.radius =0,this.fit = BoxFit.contain,this.borderAll,this.placeHolder});

   final String image;
 final double radius;
  final BoxFit? fit;
  final bool? borderAll;
  final Widget? placeHolder;
  final Widget? errorWidget;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderAll == null? BorderRadius.circular(radius):
      BorderRadius.only(topLeft: Radius.circular(radius),topRight: Radius.circular(radius)),
      child: CachedNetworkImage(
        fit: fit ?? BoxFit.contain,
       // alignment: Alignment.topCenter,
        imageUrl: image,
        placeholder: (context,url) => placeHolder?? const BuildLoadingWidget(size: 30),
        errorWidget: (context,url,error) => errorWidget ?? const Icon(Icons.error,color: Colors.red,),
      ),
    );
  }
}



