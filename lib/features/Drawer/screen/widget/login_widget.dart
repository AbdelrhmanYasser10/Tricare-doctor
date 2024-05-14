import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tricares_doctor_app/features/home_layout/cubits/app_cubit/app_cubit.dart';

import '../../../../core/Global Cubit/global_cubit.dart';
import '../../../../core/utils/utils.dart';
import '../../../../core/widgets/Carousel Widget/build_list_title.dart';
import '../../../profile/cubit/profile_cubit.dart';
import 'top_widget.dart';


class DrawerLoginWidget extends StatelessWidget {
  const DrawerLoginWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return  Column(
      children: [
        TopWidget(
          height: height,
          width: width,
          image: context.read<ProfileCubit>().userModel!.data!.partner!.partnerPic!,
          email: context.read<ProfileCubit>().emailController.text,
          name: context.read<ProfileCubit>().nameController.text,
        ),

        BuildListTitle(
          text: 'Profile',
          iconName: 'person.svg',
          function: () {
            Navigator.pop(context);
            AppCubit.get(context).currentIndexScreen = 3;
            context.read<AppCubit>().goToScreenAtIndex(3);
          },
        ),
        BuildListTitle(
          text: 'Investment',
          iconName: 'investor.svg',
          function: () {

          },
        ),
        BuildListTitle(
          text: 'Appointments',
          iconName: 'doctor.svg',
          function: () {

          },
        ),
        BuildListTitle(
          text: 'Log Out',
          iconName: 'logout.svg',
          function: () {
            Navigator.pop(context);
            var snackBar = Utils.buildSnackBar2(
              context: context,
              contentType: ContentType.success,

              message: 'Logout Successfully',
            );
            ScaffoldMessenger.of(context).showSnackBar(snackBar);

            context.read<ProfileCubit>().logOut();

          },
        ),


      ],
    );
  }
}
