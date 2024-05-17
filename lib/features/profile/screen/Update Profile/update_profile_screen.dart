import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../../../../core/InputField/custom_input/email_input_filed.dart';
import '../../../../core/InputField/custom_input/name_input_filed.dart';
import '../../../../core/InputField/custom_input/phone_input_filed.dart';
import '../../../../core/globle/color/shared_color.dart';
import '../../../../core/utils/utils.dart';
import '../../../../core/widgets/Build Password First/build_password_first.dart';
import '../../../../core/widgets/Down Button Stack/down_button_stack.dart';
import '../../cubit/profile_cubit.dart';

class UpdateProfile extends StatelessWidget {
  UpdateProfile({super.key});

  var passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return PopScope(
      canPop: true,
      onPopInvoked: (didPop)async{
        FocusScope.of(context).unfocus();
        await Future.delayed(Duration(seconds: 1));
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text('Update Profile'),
        ),
        body: SizedBox(
          height: height,
          width: width,
          child: Stack(
            children: [
              BlocConsumer<ProfileCubit, ProfileState>(
                listener: (context, state) {

                  if(state is ChangeProfileSuccess){
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
                builder: (context, state) {
                  var cubit = context.read<ProfileCubit>();
                  return SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: width * 0.03),
                      child: Form(
                        key: formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Name',
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            SizedBox(
                              height: height * 0.01,
                            ),
                            NameFiled(
                              controller: cubit.nameController,
                              edit: true,
                            ),
                            SizedBox(
                              height: height * 0.02,
                            ),
                            Text(
                              'Email',
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            SizedBox(
                              height: height * 0.01,
                            ),
                            EmailFiled(
                              controller: cubit.emailController,
                              edit: true,
                            ),
                            SizedBox(
                              height: height * 0.02,
                            ),
                            Text(
                              'Phone',
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            SizedBox(
                              height: height * 0.01,
                            ),
                            PhoneFiled(
                              controller: cubit.phoneController,
                              edit: true,
                            ),
                            SizedBox(
                              height: height * 0.01,
                            ),
                            Text(
                              'Type',
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            SizedBox(
                              height: height * 0.01,
                            ),
                            StatefulBuilder(
                              builder:
                                  (BuildContext context, StateSetter setState) {
                                return Row(
                                  children: [
                                    buildGenderType(
                                      height: height,
                                      setState: setState,
                                      context: context,
                                      cubit: cubit,
                                      text: 'Male',
                                      id: 1,
                                    ),
                                    SizedBox(
                                      width: width * 0.02,
                                    ),
                                    buildGenderType(
                                      height: height,
                                      context: context,
                                      setState: setState,
                                      cubit: cubit,
                                      text: 'Female',
                                      id: 2,
                                    ),
                                  ],
                                );
                              },
                            ),
                            SizedBox(
                              height: height * 0.12,
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
              DownButtonStack(
                width: width,
                height: height,
                button: BuildProfileButton(
                  formKey: formKey,
                  passwordController: passwordController,

                  textButton: 'Update Profile',
                  futureFunction: () async {
                    await context.read<ProfileCubit>().updateProfile(
                          name: context.read<ProfileCubit>().nameController.text.trim(),
                          email: context.read<ProfileCubit>().emailController.text.trim(),

                          timeZone: '+02:00',
                          type: context.read<ProfileCubit>().typeGender.toString(),
                          phone: context.read<ProfileCubit>().phoneController.text.trim(),
                          password: passwordController.text.trim(),
                        );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildGenderType({
    required double height,
    required ProfileCubit cubit,
    required BuildContext context,
    required String text,
    required var setState,
    required int id,
  }) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            cubit.typeGender = id;
          });
        },
        child: Container(
          height: height * 0.06,
          decoration: BoxDecoration(
            color:
                cubit.typeGender == id ? AppColor.primaryColor : Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          alignment: Alignment.center,
          child: Text(
            text,
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: !(cubit.typeGender == id)
                      ? AppColor.primaryColor
                      : Colors.white,
                ),
          ),
        ),
      ),
    );
  }
}
