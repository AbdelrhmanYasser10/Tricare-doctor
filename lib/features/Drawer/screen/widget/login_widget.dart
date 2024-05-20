import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tricares_doctor_app/features/Rooms/screens/rooms_screen.dart';
import 'package:tricares_doctor_app/features/appointments/screens/appointments_screen.dart';
import '../../../../core/Global Cubit/global_cubit.dart';
import '../../../../core/functions/fucntions.dart';
import '../../../../core/utils/utils.dart';
import '../../../../core/widgets/Carousel Widget/build_list_title.dart';
import '../../../Drawer Screen/About Us Screen/about_us_screen.dart';
import '../../../Drawer Screen/Tos Screen/tos_screen.dart';
import '../../../profile/cubit/profile_cubit.dart';
import '../../cubit/drawer_cubit.dart';
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
            GlobalCubit.get(context).currentIndexScreen = 2;
            context.read<GlobalCubit>().goToScreenAtIndex(2);
          },
        ),
        BuildListTitle(
          text: 'Terms and Conditions',
          iconName: 'term.svg',
          function: () {
            context.read<DrawerCubit>().getTosData();
            navigateTo(context, const TosScreen());
          },
        ),
        BuildListTitle(
          text: 'About Us',
          iconName: 'about_us.svg',
          function: () {
            context.read<DrawerCubit>().getAboutUsData();
            navigateTo(context, const AboutUsScreen());
          },
        ),
        ProfileCubit.get(context).userModel!.data!.partner!.partnerInvestor == "1" ? BuildListTitle(
          text: 'Rooms',
          iconName: 'investor.svg',
          function: () {
            navigateTo(context, const RoomsScreen());
          },
        ):const SizedBox.shrink(),
        ProfileCubit.get(context).userModel!.data!.partner!.partnerDoctor == "1" ?BuildListTitle(
          text: 'Schedule',
          iconName: 'doctor.svg',
          function: () {
              //context.read<AppointementCubit>().getSchedule();
              navigateTo(context, const AppointmentsScreen());
          },
        ):const SizedBox.shrink(),
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
