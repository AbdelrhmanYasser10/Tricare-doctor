import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tricares_doctor_app/features/Authentication/screens/Login/login_screen.dart';
import 'package:tricares_doctor_app/features/Authentication/screens/Register/register_screen.dart';

import '../../../../core/Global Cubit/global_cubit.dart';
import '../../../../core/functions/fucntions.dart';
import '../../../../core/globle/color/light_app_color.dart';
import '../../../../core/utils/utils.dart';
import '../../../../core/widgets/Carousel Widget/build_list_title.dart';
import '../../../../generated/l10n.dart';
import '../../../Drawer Screen/About Us Screen/about_us_screen.dart';
import '../../../Drawer Screen/Tos Screen/tos_screen.dart';
import '../../../home/cubits/home_cubit.dart';
import '../../../home_layout/cubits/app_cubit/app_cubit.dart';
import '../../../profile/cubit/profile_cubit.dart';
import '../../cubit/drawer_cubit.dart';

class NotSignInWidget extends StatelessWidget {
  const NotSignInWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int selectOption = context.read<GlobalCubit>().selectOption;
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
          text: S.of(context).login,
          iconName: 'login.svg',
          function: () {

            Navigator.push(
              context,
              MaterialPageRoute(builder: (_)=>const LoginScreen()),
            );
          },
        ),
        BuildListTitle(
          text: S.of(context).apply,
          iconName: 'person.svg',
          function: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_)=>const RegisterScreen()),
            );
          },
        ),
        BuildListTitle(
          text: S.of(context).changeLanguage,
          iconName: 'language.svg',
          function: () async {
            showDialog(

                context: context,

                builder: (context){

                  return AlertDialog(

                    surfaceTintColor: LightAppColor.foreGroundColors,
                    title:  Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        S.of(context).changeLanguage,
                      ),
                    ),

                    content: StatefulBuilder(
                      builder: (BuildContext ctx, StateSetter setState){
                        return Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [



                            RadioListTile(
                              title:  Text('English'),
                              value: 1,
                              groupValue: selectOption,
                              onChanged: (value) {
                                setState(() {
                                  selectOption = value!;
                                });
                              },

                            ),
                            RadioListTile(
                              title:  Text("العربية"),

                              value: 2,
                              groupValue: selectOption,
                              onChanged: (value) {
                                setState(() {
                                  selectOption = value!;
                                });
                              },

                            ),
                            SizedBox(height: height*0.03,),
                            ElevatedButton(

                              onPressed: () async {
                                await  context.read<GlobalCubit>().changeLocal(
                                  value: selectOption,
                                );
                                context.read<AppCubit>().getHomeData();
                                context.read<HomeCubit>().getTabs();
                                context.read<ProfileCubit>().getAllCountries();
                                context.read<ProfileCubit>().postUserData();
                                Navigator.pop(ctx);
                              },
                              child: Text(S.of(context).save),
                              style: ElevatedButton.styleFrom(
                                minimumSize: Size(width, height*0.06),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  );
                }
            );







            // context.read<AppCubit>().postUserData();

          },
        ),
        BuildListTitle(
          text: S.of(context).terms,
          iconName: 'term.svg',
          function: () {
            context.read<DrawerCubit>().getTosData();
            navigateTo(context, TosScreen());
          },
        ),
        BuildListTitle(
          text: S.of(context).about,
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
