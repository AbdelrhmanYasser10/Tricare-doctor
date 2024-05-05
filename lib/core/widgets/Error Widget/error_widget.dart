import 'package:flutter/material.dart';

import '../../component/SVG/svg.dart';

class BuildErrorWidget extends StatelessWidget {


  final String error;

  const BuildErrorWidget({
    Key? key,
    required this.error
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return  Center(
      child: Padding(
        padding:  EdgeInsets.symmetric(horizontal: width*0.04),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const BuildIconSvg(name: 'error.svg',size: 120,color: Colors.red,),
            SizedBox(height: height*0.05,),
            Text(
              error,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
