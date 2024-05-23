import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tricares_doctor_app/features/Authentication/screens/Login/login_screen.dart';
import 'package:tricares_doctor_app/features/Authentication/screens/Register/register_screen.dart';

import '../../../../core/Global Cubit/global_cubit.dart';
import '../../../../core/functions/fucntions.dart';
import '../../../../core/utils/utils.dart';
import '../../../../core/widgets/Carousel Widget/build_list_title.dart';
import '../../../Drawer Screen/About Us Screen/about_us_screen.dart';
import '../../../Drawer Screen/Tos Screen/tos_screen.dart';
import '../../../profile/cubit/profile_cubit.dart';
import '../../cubit/drawer_cubit.dart';

class NotSignInWidget extends StatelessWidget {
  const NotSignInWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return  Column(
      children: [
        SizedBox(
        height: height*0.3,
        child: Container(
          color: Colors.white,
          child: Image.asset(
            'assets/images/logo.png'
          ),
        ),
        ),
        BuildListTitle(
          text: 'Sign In',
          iconName: 'login.svg',
          function: () {

            Navigator.push(
              context,
              MaterialPageRoute(builder: (_)=>const LoginScreen()),
            );
          },
        ),
        BuildListTitle(
          text: 'Apply for a partnership',
          iconName: 'person.svg',
          function: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_)=>const RegisterScreen()),
            );
          },
        ),
        BuildListTitle(
          text: 'Terms and Conditions',
          iconName: 'term.svg',
          function: () {
            context.read<DrawerCubit>().getTosData();
            navigateTo(context, TosScreen());
          },
        ),
        BuildListTitle(
          text: 'About Us',
          iconName: 'about_us.svg',
          function: () {
            context.read<DrawerCubit>().getAboutUsData();
            navigateTo(context, AboutUsScreen());
          },
        ),



      ],
    );
  }
}
