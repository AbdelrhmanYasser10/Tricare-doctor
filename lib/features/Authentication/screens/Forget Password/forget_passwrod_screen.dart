import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_btn/loading_btn.dart';
import 'package:tricares_doctor_app/core/InputField/custom_input/email_input_field.dart';

import '../../../../core/functions/fucntions.dart';
import '../../../../core/globle/color/shared_color.dart';
import '../../../../core/utils/utils.dart';
import '../../../../generated/l10n.dart';
import '../../cubit/auth_cubit.dart';
import '../Reset Password/reset_password_screen.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  late TextEditingController emailController;
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    emailController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.04),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: height * 0.05,
                width: width,
              ),
              Center(
                child: SizedBox(
                  child: Image.asset('assets/images/forget_password.png'),
                ),
              ),
              Text(
                S.of(context).forgetPassword,
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              SizedBox(
                height: height * 0.01,
              ),
              Text(
                S.of(context).forgetPasswordMessage,
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: Colors.grey,
                    ),
              ),
              SizedBox(
                height: height * 0.03,
              ),
              Form(
                key: formKey,
                child: EmailFiled(controller: emailController),
              ),
              SizedBox(
                height: height * 0.05,
              ),

              ForgetPasswordButton(formKey: formKey, emailController: emailController),
              
            ],
          ),
        ),
      ),
    );
  }
}

class ForgetPasswordButton extends StatelessWidget {
  final formKey;
  final TextEditingController emailController;


  const ForgetPasswordButton(
      {super.key,
        required this.formKey,
        required this.emailController,
       });

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return BlocListener<AuthCubit, AuthState>(
  listener: (context, state) {

    if(state is ForgetPasswordSuccess){
      if(state.hasError){
        var snackBar = Utils.buildSnackBar2(
          contentType: ContentType.failure,
          context: context,

          message: state.errors.join(' '),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
      else
      {
        var snackBar = Utils.buildSnackBar2(
          contentType: ContentType.success,
          context: context,

          message: state.messages.join(' '),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);

        navigateTo(context, ResetPasswordScreen(
          studentUniqueId: state.uniqueId!,
          email: emailController.text.trim(),
        ));
      }


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
        child: Text(S.of(context).send),
        onTap: (startLoading, stopLoading, btnState) async {
          if (formKey.currentState!.validate()) {
            if (btnState == ButtonState.idle) {
              startLoading();

              await context
                  .read<AuthCubit>()
                  .postForgetPassword(email: emailController.text.trim());

              stopLoading();
            }
          }
        },
      ),
    ),
);
  }
}

