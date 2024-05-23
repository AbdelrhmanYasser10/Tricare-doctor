import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tricares_doctor_app/core/globle/color/light_app_color.dart';
import 'package:tricares_doctor_app/features/Rooms/screens/rooms_screen.dart';
import 'package:tricares_doctor_app/features/appointments/screens/appointments_screen.dart';
import 'package:tricares_doctor_app/features/home/cubits/home_cubit.dart';
import 'package:tricares_doctor_app/features/profile/screen/Profile/profile_screen.dart';
import 'package:tricares_doctor_app/features/profits/screens/profits_screen.dart';
import '../../../../core/Global Cubit/global_cubit.dart';
import '../../../../core/functions/fucntions.dart';
import '../../../../core/utils/utils.dart';
import '../../../../core/widgets/Carousel Widget/build_list_title.dart';
import '../../../../generated/l10n.dart';
import '../../../Drawer Screen/About Us Screen/about_us_screen.dart';
import '../../../Drawer Screen/Tos Screen/tos_screen.dart';
import '../../../home_layout/cubits/app_cubit/app_cubit.dart';
import '../../../profile/cubit/profile_cubit.dart';
import '../../cubit/drawer_cubit.dart';
import 'top_widget.dart';


class DrawerLoginWidget extends StatefulWidget {
  final bool isFromHome;
  const DrawerLoginWidget({super.key , required this.isFromHome});

  @override
  State<DrawerLoginWidget> createState() => _DrawerLoginWidgetState();
}

class _DrawerLoginWidgetState extends State<DrawerLoginWidget> {

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    int selectOption = context.read<GlobalCubit>().selectOption;
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
          text: S.of(context).profile,
          iconName: 'person.svg',
          function: () {
            Navigator.pop(context);
            if(widget.isFromHome){
            GlobalCubit.get(context).currentIndexScreen = 2;
            context.read<GlobalCubit>().goToScreenAtIndex(2);
            }
            else{
              navigateTo(context, const ProfileScreen());
            }
          },
        ),

        ProfileCubit.get(context).userModel!.data!.partner!.partnerInvestor == "1" ? BuildListTitle(
          text: S.of(context).myRooms,
          iconName: 'investor.svg',
          function: () {
            navigateTo(context, const RoomsScreen());
          },
        ):const SizedBox.shrink(),
        ProfileCubit.get(context).userModel!.data!.partner!.partnerDoctor == "1" ?BuildListTitle(
          text: S.of(context).mySchedule,
          iconName: 'doctor.svg',
          function: () {
            //context.read<AppointementCubit>().getSchedule();
            navigateTo(context, const AppointmentsScreen());
          },
        ):const SizedBox.shrink(),

        BuildListTitle(
          text: S.of(context).myProfits,
          iconName: 'profits.svg',
          function: () {

            navigateTo(context, const ProfitsScreen());

          },
        ),
        BuildListTitle(
          text: S.of(context).logout,
          iconName: 'logout.svg',
          function: () {

            Navigator.pop(context);

            var snackBar = Utils.buildSnackBar2(
              context: context,
              contentType: ContentType.success,

              message: S.of(context).logoutSuccessfully,
            );
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
            context.read<ProfileCubit>().logOut();

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
          text: S.of(context).about,
          iconName: 'about_us.svg',
          function: () {
            context.read<DrawerCubit>().getAboutUsData();
            navigateTo(context, const AboutUsScreen());
          },
        ),
        BuildListTitle(
          text: S.of(context).terms,
          iconName: 'term.svg',
          function: () {
            context.read<DrawerCubit>().getTosData();
            navigateTo(context, const TosScreen());
          },
        ),


      ],
    );
  }
}
