import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/component/Network Image/network_image.dart';
import '../../../core/component/components.dart';
import '../../../core/functions/fucntions.dart';
import '../../../core/widgets/Build Container Widget/build_container_widget.dart';
import '../../../generated/l10n.dart';
import '../../Drawer/cubit/drawer_cubit.dart';


class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).about),
      ),

      body: BlocBuilder<DrawerCubit, DrawerState>(
        builder: (context, state) {
          var cubit = context.read<DrawerCubit>();
          return  cubit.aboutUsModel == null? BuildShimmerAboutApplication(
            title: S.of(context).about,
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
                      image: cubit.aboutUsModel!.data!.static!.staticPic!,
                      radius: 12,
                    ),
                  ),
                  SizedBox(height: height*0.05,),
                  Text(
                    cubit.aboutUsModel!.data!.static!.staticTitle!,
                    style: Theme.of(context).textTheme.headlineLarge,
                    textAlign: TextAlign.center,


                  ).animate().fadeIn(duration: 200.ms).then(delay: 100.ms).fade(),

                  SizedBox(height: height*0.02,),
                  Text(
                    cleanHtmlToPlainText(cubit.aboutUsModel!.data!.static!.staticDescription!,maxLength: 5000),
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

class BuildShimmerAboutApplication extends StatelessWidget {

  final String title;
  const BuildShimmerAboutApplication({required this.title});

  @override
  Widget build(BuildContext context) {

    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return  BuildShimmer(
      child: Padding(
        padding:  EdgeInsets.symmetric(horizontal: width*0.03),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: height*0.02,),
              Container(
                  width: width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.grey,
                  ),
                  child: AspectRatio(
                    aspectRatio: 16/9,
                  )
              ),
              SizedBox(height: height*0.05,),

              Text(
                title,
                style: Theme.of(context).textTheme.titleLarge,
              ),

              SizedBox(height: height*0.02,),

              ListView.builder(
                itemCount: 8,
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context,index){
                  return  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: BuildContainer(height: height*0.01),
                  );
                },
              ),
              SizedBox(height: height*0.02,),

              ListView.builder(
                itemCount: 8,
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context,index){
                  return  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: BuildContainer(height: height*0.01),
                  );
                },
              )






            ],
          ),
        ),
      ),
    );
  }
}


