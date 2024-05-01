import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_btn/loading_btn.dart';

import '../../../../core/InputField/custom_input/email_input_field.dart';
import '../../../../core/InputField/custom_input/name_input_field.dart';
import '../../../../core/InputField/custom_input/password_input_field.dart';
import '../../../../core/InputField/custom_input/phone_input_field.dart';
import '../../../../core/functions/fucntions.dart';
import '../../../../core/globle/color/shared_color.dart';
import '../../../../core/utils/utils.dart';
import '../../cubit/auth_cubit.dart';
import '../Login/login_screen.dart';
import '../OTP/otp_screen.dart';

class RegisterScreen extends StatefulWidget {
  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController nameController;
  late TextEditingController phoneController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    emailController = TextEditingController();
    passwordController = TextEditingController();
    nameController = TextEditingController();
    phoneController = TextEditingController();
  }

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Align(
        alignment: Alignment.bottomCenter,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.05),
            child: Column(
              children: [
                Image.asset(
                  'assets/images/logo.png',
                  width: width * 0.6,
                  height: height * 0.1,
                ),
                Text(
                  'Welcome Again To TriCare',
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(color: Colors.grey),
                ),
                SizedBox(
                  height: height * 0.05,
                ),
                Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Register',
                        style: Theme.of(context).textTheme.headlineLarge,
                      ),
                      Text(
                        'Enter Your Personal Information',
                        style: Theme.of(context).textTheme.titleMedium!.copyWith(
                              color: Colors.grey,
                            ),
                      ),
                      SizedBox(
                        height: height * 0.03,
                      ),
                      SizedBox(
                        height: height * 0.02,
                      ),
                      NameFiled(controller: nameController),
                      SizedBox(
                        height: height * 0.02,
                      ),
                      PhoneFiled(controller: phoneController),
                      SizedBox(
                        height: height * 0.02,
                      ),
                      EmailFiled(controller: emailController),
                      SizedBox(
                        height: height * 0.02,
                      ),
                      PasswordFiled(controller: passwordController,hint: 'Password',),
                      SizedBox(
                        height: height * 0.04,
                      ),
                      RegisterButton(
                          formKey: formKey,
                          emailController: emailController,
                          passwordController: passwordController,
                          phoneController: phoneController,
                          nameController: nameController,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: height * 0.08,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Have an account?',
                      style: Theme.of(context).textTheme.titleMedium!,
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginScreen()),
                            result: (route) => false);
                      },
                      child: Text(
                        'Login',
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              decoration: TextDecoration.underline,
                              decorationColor: AppColor.primaryColor,
                              color: AppColor.primaryColor,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: height * 0.01,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

    emailController.dispose();
    phoneController.dispose();
    nameController.dispose();
    passwordController.dispose();
  }
}

class RegisterButton extends StatelessWidget {
  final formKey;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController nameController;
  final TextEditingController phoneController;

  const RegisterButton({
    super.key,
    required this.formKey,
    required this.emailController,
    required this.passwordController,
    required this.phoneController,
    required this.nameController,
  });

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return BlocListener<AuthCubit, AuthState>(
  listener: (context, state) {
    if(state is RegisterSuccess){

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
        navigateTo(context, OTPScreen(
          code: state.code!,
          name: nameController.text.trim(),
          email: emailController.text.trim(),
          phone: phoneController.text.trim(),
          password: passwordController.text.trim(),
        ),
        );
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
        child: const Text("Register"),
        onTap: (startLoading, stopLoading, btnState) async {
          if (formKey.currentState!.validate()) {
            if (btnState == ButtonState.idle) {
              startLoading();
              // call your network api
              await context.read<AuthCubit>().postRegister(
                email: emailController.text.trim(),
                password: passwordController.text.trim(),
                name: nameController.text.trim(),
                phone: phoneController.text.trim(),
              );
              stopLoading();

            }
          }
        },
      ),
    ),
);
  }
}
