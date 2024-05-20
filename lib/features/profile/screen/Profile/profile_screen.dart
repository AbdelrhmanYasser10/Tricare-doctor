import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tricares_doctor_app/features/profile/screen/Profile/widget/buid_delete_accout.dart';
import 'package:tricares_doctor_app/features/profile/screen/Profile/widget/build_changeProfilePicture_with_password.dart';
import 'package:tricares_doctor_app/features/profile/screen/Profile/widget/loading_shimmer.dart';
import 'package:tricares_doctor_app/features/profile/screen/Profile/widget/top_widget.dart';

import '../../../../core/functions/fucntions.dart';
import '../../../../core/network/Local/CashHelper.dart';
import '../../../../core/utils/utils.dart';
import '../../../../core/widgets/Carousel Widget/build_list_title.dart';
import '../../../../core/widgets/Login First/login_first_widget.dart';
import '../../cubit/profile_cubit.dart';
import '../Change Password/change_password_screen.dart';
import '../Update Profile/update_profile_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: BlocBuilder<ProfileCubit, ProfileState>(
        builder: (context, state) {
          var cubit = context.read<ProfileCubit>();
          return CashHelper.getData(key: 'login') == null
              ? BuildLoginFirst(
                  width: width,
                  height: height,
                  heightImage: width,
                  widthImage: width,
                )
              : cubit.userModel == null
                  ? const LoadingShimmerWidget()
                  : SingleChildScrollView(
                      child: Column(
                        children: [
                          TopWidget(height: height, width: width),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: width * 0.04,
                                vertical: height * 0.02),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  width: double.infinity,
                                ),
                                Text(
                                  context
                                      .read<ProfileCubit>()
                                      .userModel!
                                      .data!
                                      .partner!
                                      .partnerFullname!,
                                  style: Theme.of(context).textTheme.titleLarge,
                                ),
                                Text(
                                  context
                                      .read<ProfileCubit>()
                                      .userModel!
                                      .data!
                                      .partner!
                                      .partnerPhone!,
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium!
                                      .copyWith(color: Colors.grey),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: width * 0.0,
                                vertical: height * 0.02),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                BuildListTitle(
                                  text: 'Update Profile',
                                  iconName: 'edit.svg',
                                  function: () {
                                    navigateTo(context, UpdateProfile());
                                  },
                                ),
                                /*SizedBox(
                                  height: height * 0.02,
                                ),
                                BlocListener<ProfileCubit, ProfileState>(
                                  listener: (context, state) {

                                    if(state is ChangeProfilePictureSuccess){
                                      Navigator.pop(context);

                                      if(state.hasError){
                                        var snackBar = Utils.buildSnackBar2(
                                            contentType: ContentType.failure,
                                            context: context,
                                            message: state.errors[0]);
                                        ScaffoldMessenger.of(
                                            context)
                                            .showSnackBar(snackBar);
                                      }
                                      else{
                                        context.read<ProfileCubit>().postUserData();
                                        var snackBar = Utils.buildSnackBar2(
                                            contentType: ContentType.success,
                                            context: context,
                                            message: state.messages[0]);
                                        ScaffoldMessenger.of(
                                            context)
                                            .showSnackBar(snackBar);

                                      }
                                    }



                                  },
                                  child: BuildChangeProfilePicture(
                                    passwordController: passwordController,
                                    futureFunction: () async {
                                     await context.read<ProfileCubit>().changeProfilePicture(password: passwordController.text.trim());

                                    },
                                  ),
                                ),*/
                                SizedBox(
                                  height: height * 0.02,
                                ),
                                BuildListTitle(
                                  text: 'Change Password',
                                  iconName: 'change_password.svg',
                                  function: () {
                                    navigateTo(context, ChangePasswordScreen());
                                  },
                                ),
                                SizedBox(
                                  height: height * 0.02,
                                ),

                                BuildDeleteAccountWidget(

                                ),

                              ],
                            ),
                          ),
                        ],
                      ),
                    );
        },
      ),
    );
  }
}
