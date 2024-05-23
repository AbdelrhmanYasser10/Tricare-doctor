import 'package:flutter/material.dart';

import '../Profile/profile_screen.dart';


class MainProfileScreen extends StatelessWidget {
  const MainProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ProfileScreen();
  }
}


// old main profile code
/*Scaffold(
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
              iconName: 'about_us.svg',
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
        ),
    )*/