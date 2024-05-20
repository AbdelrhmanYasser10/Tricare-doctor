import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/functions/fucntions.dart';
import '../../../../core/network/Local/CashHelper.dart';
import '../../../../core/widgets/Carousel Widget/build_list_title.dart';
import '../../../Authentication/screens/Login/login_screen.dart';
import '../../../Drawer Screen/About Us Screen/about_us_screen.dart';
import '../../../Drawer Screen/Tos Screen/tos_screen.dart';
import '../../../Drawer/cubit/drawer_cubit.dart';
import '../../cubit/profile_cubit.dart';
import '../Profile/profile_screen.dart';


class MainProfileScreen extends StatelessWidget {
  const MainProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          children: [
            BuildListTitle(
              text: 'Profile',
              iconName: 'user.svg',
              function: () {
                navigateTo(context, ProfileScreen());
              },
            ),
            BuildListTitle(
              text: 'About Us',
              iconName: 'review.svg',
              function: () {
                context.read<DrawerCubit>().getAboutUsData();
                navigateTo(context, AboutUsScreen());
              },
            ),
            BuildListTitle(
              text: 'Terms & Conditions',
              iconName: 'term.svg',
              function: () {
                context.read<DrawerCubit>().getTosData();
                navigateTo(context, TosScreen());
              },
            ),

            BlocBuilder<ProfileCubit, ProfileState>(
              builder: (context, state) {
                return BuildListTitle(
                  text: CashHelper.getData(key: 'login') == null
                      ? 'Login'
                      : 'Log out',
                  iconName: CashHelper.getData(key: 'login') == null
                      ? 'login.svg'
                      : 'logout.svg',
                  function: () {
                    if (CashHelper.getData(key: 'login') == null) {
                      navigateTo(context, const LoginScreen());
                    }
                    else {
                      context.read<ProfileCubit>().logOut();
                    }
                  },
                );
              },
            ),
          ],
        ));
  }
}
