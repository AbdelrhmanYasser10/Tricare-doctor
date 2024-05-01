import 'package:flutter/material.dart';

import '../../../../core/component/ElevatedButton Widget/build_elevated_button.dart';

class BuildTopWidget extends StatelessWidget {
  final String image;


  const BuildTopWidget({super.key, required this.image, });


  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return SizedBox(
      height: height * 0.7,
      width: width,
      child: Stack(
        children: [
          SizedBox(
            height: height * 0.7,
            width: width,
            child: FadeInImage(
              fit: BoxFit.cover,
              placeholder: const AssetImage('assets/images/logo_onboard.png'),
              image: AssetImage(image),
            ),
          ),
          Container(
            width: double.infinity,
            height: height * 0.7,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black54,
                    Colors.black38,
                    Colors.black26,
                    Colors.teal.shade300,
                  ],
                ),
            ),
          ),
        ],
      ),
    );
  }
}
