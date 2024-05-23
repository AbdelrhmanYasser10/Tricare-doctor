import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../../../../core/InputField/custom_input/email_input_filed.dart';
import '../../../../core/InputField/custom_input/phone_input_filed.dart';
import '../../../../core/component/DropDownButtonField/drop_down_button_filed.dart';
import '../../../../core/globle/color/shared_color.dart';
import '../../../../core/utils/utils.dart';
import '../../../../core/widgets/Build Password First/build_password_first.dart';
import '../../../../core/widgets/Down Button Stack/down_button_stack.dart';
import '../../../../generated/l10n.dart';
import '../../cubit/profile_cubit.dart';

class UpdateProfile extends StatefulWidget {
  const UpdateProfile({super.key});

  @override
  State<UpdateProfile> createState() => _UpdateProfileState();
}

class _UpdateProfileState extends State<UpdateProfile> {
  var passwordController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    context.read<ProfileCubit>().getAllCountries();
  }

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
          title: Text(S.of(context).updateProfile),
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
                      context.read<ProfileCubit>().postUserData();
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
                              S.of(context).email,
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
                              S.of(context).phone,
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
                            SizedBox(
                              height: height * 0.02,
                            ),
                            Text(
                              S.of(context).wpPhone,
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            SizedBox(
                              height: height * 0.01,
                            ),
                            WhatsappPhoneField(
                              controller: cubit.whatsappPhoneController,
                              edit: true,
                            ),
                            SizedBox(
                              height: height * 0.01,
                            ),
                            Text(
                              S.of(context).country,
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            SizedBox(
                              height: height * 0.01,
                            ),
                            BuildDropDownButtonField(
                              width: width * 0.5,
                              height: height,
                              valid: (p0) {
                                return null;
                              },
                              onChanged: (p0) {
                                context.read<ProfileCubit>().country = p0!;
                                setState(() {});
                              },
                              hint: context.read<ProfileCubit>().country,
                              item: ProfileCubit.get(context).allCounties.map((e) {
                                return e.label;
                              }).toList(),
                              num: 1,
                              cubit: ProfileCubit.get(context),
                            ),
                            SizedBox(
                              height: height * 0.01,
                            ),
                            Text(
                              S.of(context).wpNotifications,
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            SizedBox(
                              height: height * 0.01,
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: width * 0.026,
                                vertical: height * 0.0176,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15.0),
                                color: AppColor.primaryColor.withOpacity(0.4),
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      S.of(context).enable,
                                      style: Theme.of(context).textTheme.titleMedium!.copyWith(),
                                    ),
                                  ),
                                  Switch(
                                      value: context.read<ProfileCubit>().whatsappEnabled == "1",
                                      onChanged: (value) {
                                        if(value == false){
                                          context.read<ProfileCubit>().whatsappEnabled = "0";
                                        }
                                        else{
                                          context.read<ProfileCubit>().whatsappEnabled = "1";
                                        }
                                        setState(() {

                                        });
                                      },
                                  ),
                                ],
                              ),
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

                  textButton: S.of(context).updateProfile,
                  futureFunction: () async {
                    await context.read<ProfileCubit>().updateProfile(
                          name: context.read<ProfileCubit>().nameController.text.trim(),
                          email: context.read<ProfileCubit>().emailController.text.trim(),
                          whatsapp: context.read<ProfileCubit>().whatsappPhoneController.text.trim(),
                          whatsappEnabled: int.parse(context.read<ProfileCubit>().whatsappEnabled),
                          country: context.read<ProfileCubit>().country,
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
}
