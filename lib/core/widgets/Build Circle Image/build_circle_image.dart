import 'package:flutter/material.dart';

import '../../component/Network Image/network_image.dart';

class BuildCircleImage extends StatelessWidget {
  final String image;
  String? placeholder;
  final double width;

   BuildCircleImage({
    super.key,
    required this.image,
     this.placeholder,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: SizedBox(
        height: width,
        width: width,
        child: BuildImage(
            image: image,
            fit: BoxFit.cover,
           ),
      ),
    );
  }
}
