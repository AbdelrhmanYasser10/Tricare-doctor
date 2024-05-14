import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/globle/color/light_app_color.dart';
import '../../../../../core/globle/color/shared_color.dart';
import '../../../cubit/profile_cubit.dart';


class TopWidget extends StatelessWidget {
  final double height;
  final double width;

  const TopWidget({super.key, required this.height, required this.width});



  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height*0.3,
      width: width,

      child: Stack(

        children: [
          SizedBox(
            height: height*0.2,
            width: width,
            child: Stack(
              children: [
                SizedBox(
                  width:width,
                  child: const FadeInImage(
                    fit: BoxFit.cover,
                    image: AssetImage('assets/images/backgroud2.jpg'),
                    placeholder: AssetImage('assets/images/logo.png'),
                  ),
                ),

                Container(
                  height: height*0.2,
                  width: width,
                  color: AppColor.primaryColor.withOpacity(0.4),

                ),

              ],
            ),
          ),
          UserPerson(height: height, width: width),

        ],
      ),
    );
  }
}


class UserPerson extends StatelessWidget {
  final double height;
  final double width;
  const UserPerson({super.key,required this.height,required this.width});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      child: Padding(
        padding:  EdgeInsets.symmetric(horizontal: width*0.04),
        child: Container(

          padding: const EdgeInsets.all(5),
          decoration: const BoxDecoration(
            color: LightAppColor.backgroundColor,
            shape: BoxShape.circle,
          ),
          child: BlocBuilder<ProfileCubit, ProfileState>(
           builder: (context, state) {
             var cubit = context.read<ProfileCubit>();
             return CircleAvatar(
                 radius: height*0.1,
                 backgroundImage: NetworkImage(context.read<ProfileCubit>().userModel!.data!.partner!.partnerPic!),
             );

  },
),
        ),
      ),
    );
  }
}

