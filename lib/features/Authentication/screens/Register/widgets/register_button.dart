import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_btn/loading_btn.dart';

import '../../../../../core/globle/color/shared_color.dart';
import '../../../../../core/utils/utils.dart';
import '../../../cubit/auth_cubit.dart';

class RegisterButton extends StatelessWidget {
  final formKey;
  final bool isDoctor;
  final String? gender;
  final String? country;
  final TextEditingController emailController;
  final TextEditingController nameController;
  final TextEditingController phoneController;
  final TextEditingController? phone2Controller;
  final TextEditingController? subjectController;
  final TextEditingController? messageController;

  const RegisterButton({
    super.key,
    required this.formKey,
    required this.emailController,
    required this.phoneController,
    required this.nameController,
    required this.isDoctor,
    this.messageController,
    this.subjectController,
    this.phone2Controller,
    this.gender,
    this.country,
  });

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is RegisterSuccess) {
          if (state.hasError) {
            var snackBar = Utils.buildSnackBar2(
                contentType: ContentType.failure,
                context: context,
                message: state.errors[0]);
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          } else {
            var snackBar = Utils.buildSnackBar2(
                contentType: ContentType.failure,
                context: context,
                message: "Your request has been sent successfully");
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          }
        } else if (state is RegisterError) {
          var snackBar = Utils.buildSnackBar2(
              contentType: ContentType.failure,
              context: context,
              message: "error");
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        } else if (state is NoInterNetConnection) {
          var snackBar = Utils.buildSnackBar2(
              contentType: ContentType.failure,
              context: context,
              message: "Check your internet connection");
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      },
      child: Center(
        child: LoadingBtn(
          height: height * 0.06,
          borderRadius: 120,
          animate: true,
          color: AppColor.primaryColor,
          width: width,
          loader: Container(
            padding: const EdgeInsets.all(15),
            width: 50,
            height: 50,
            child: const CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
            ),
          ),
          child: const Text("Apply"),
          onTap: (startLoading, stopLoading, btnState) async {
            if (formKey.currentState!.validate()) {
              if (btnState == ButtonState.idle) {
                startLoading();
                // call your network api
                if (isDoctor) {
                  if (AuthCubit.get(context).xFiles.isNotEmpty) {
                    await context.read<AuthCubit>().postRegister(
                          email: emailController.text.trim(),
                          subTitle: messageController!.text.trim(),
                          isDoctor: isDoctor,
                          title: subjectController!.text.trim(),
                          name: nameController.text.trim(),
                          phone: phoneController.text.trim(),
                        );
                  } else {
                    var snackBar = Utils.buildSnackBar2(
                        contentType: ContentType.failure,
                        context: context,
                        message: "You must add one file at least");
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  }
                } else {
                  await context.read<AuthCubit>().postRegister(
                        email: emailController.text.trim(),
                        isDoctor: isDoctor,
                        name: nameController.text.trim(),
                        phone: phoneController.text.trim(),
                        phone2: phone2Controller!.text.trim(),
                        gender: gender! == "Male" ? 1 : 2,
                        country: country!,
                      );
                }
                stopLoading();
              }
            }
          },
        ),
      ),
    );
  }
}
