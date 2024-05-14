import 'package:flutter/material.dart';


import '../../../../../core/component/components.dart';
import '../../../../../core/widgets/Build Container Widget/build_container_widget.dart';
import '../../../../../core/widgets/Carousel Widget/build_list_title.dart';

class LoadingShimmerWidget extends StatelessWidget {
  const LoadingShimmerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return BuildShimmer(
      child: Column(
        children: [

        SizedBox(
        height: height*0.3,
        width: width,

        child: Stack(

          children: [
            Container(
              height: height*0.2,
              width: width,
              color: Colors.grey,

            ),
            Positioned(
              bottom: 0,
              child: Padding(
                padding:  EdgeInsets.symmetric(horizontal: width*0.04),
                child: Container(

                  padding: const EdgeInsets.all(5),
                  decoration: const BoxDecoration(
                    color: Colors.grey,
                    shape: BoxShape.circle,
                  ),
                  child: CircleAvatar(
                      radius: height*0.1,

                  ),
                ),
              ),
            ),





          ],
        ),
      ),

          Padding(
            padding:  EdgeInsets.symmetric(horizontal: width*0.04,vertical: height*0.02),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(width: double.infinity,),

                BuildContainer(height: height*0.02,width: width*0.5,),
                SizedBox(height: height*0.02,),
                BuildContainer(height: height*0.02,width: width*0.3,),


                Padding(
                  padding:  EdgeInsets.symmetric(horizontal: width*0.0,vertical: height*0.02),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      BuildListTitle(
                        text: 'Update Profile',
                        iconName: 'edit.svg',
                        function: (){

                        },
                      ),

                      SizedBox(
                        height: height*0.02,
                      ),

                      BuildListTitle(
                        text: 'Change Profile Picture',
                        iconName: 'profile_pic.svg',
                        function: (){
                        },
                      ),

                      SizedBox(
                        height: height*0.02,
                      ),

                      BuildListTitle(
                        text: 'Change Password',
                        iconName: 'change_password.svg',
                        function: (){

                        },
                      ),

                      SizedBox(
                        height: height*0.02,
                      ),


                      BuildListTitle(
                        text: 'Delete Account',
                        iconName: 'delete.svg',
                        function: (){

                        },
                      ),







                    ],
                  ),
                ),



              ],
            ),
          ),

        ],
      ),
    );
  }
}
