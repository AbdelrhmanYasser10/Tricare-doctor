import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/component/Network Image/network_image.dart';
import '../../../core/functions/fucntions.dart';
import '../../Drawer/cubit/drawer_cubit.dart';
import '../About Us Screen/about_us_screen.dart';


class TosScreen extends StatelessWidget {
  const TosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text('Terms and Conditions'),
      ),

      body: BlocBuilder<DrawerCubit, DrawerState>(
        builder: (context, state) {
          var cubit = context.read<DrawerCubit>();
          return  cubit.tosModel == null? BuildShimmerAboutApplication(
            title: 'Terms and Conditions',
          ):
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: width*0.03),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: height*0.02,),
                  SizedBox(
                    width: width,
                    child: BuildImage(
                        image: cubit.tosModel!.data!.static!.staticPic!,
                       radius: 12,
                    ),
                  ),
                  SizedBox(height: height*0.05,),
                  Text(
                    cubit.tosModel!.data!.static!.staticTitle!,
                    style: Theme.of(context).textTheme.headlineLarge,
                    textAlign: TextAlign.center,
              
                  ).animate().fadeIn(duration: 200.ms).then(delay: 100.ms).fade(),
              
                  SizedBox(height: height*0.02,),
                  Text(
                    cleanHtmlToPlainText(cubit.tosModel!.data!.static!.staticDescription!,maxLength: 5000),
                    style: Theme.of(context).textTheme.bodyLarge,
                    textAlign: TextAlign.center,
              
                  ).animate()
                      .fadeIn(duration: 300.ms)
                      .then(delay: 200.ms) // baseline=800ms
                      .fade(),
              
                ],
              ),
            ),
          );
        },
      ),

    );
  }
}





