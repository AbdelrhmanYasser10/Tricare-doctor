import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


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
          image: context.read<ProfileCubit>().userModel!.data!.patient!.patientProfilepicture!,
          email: context.read<ProfileCubit>().emailController.text,
          name: context.read<ProfileCubit>().nameController.text,
        ),
        SizedBox(
          height: height * 0.02,
        ),
        BuildListTitle(
          text: 'Profile',
          iconName: 'person.svg',
          function: () {
            Navigator.pop(context);
            context.read<GlobalCubit>().goToScreenAtIndex(2);
          },
        ),
        BuildListTitle(
          text: 'Profits',
          iconName: 'profits.svg',
          function: () {

          },
        ),
        BuildListTitle(
          text: 'Investments',
          iconName: 'investments.svg',
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
