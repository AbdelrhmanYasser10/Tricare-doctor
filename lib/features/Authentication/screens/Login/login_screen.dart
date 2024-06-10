import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_btn/loading_btn.dart';
import 'package:tricares_doctor_app/core/InputField/custom_input/name_input_field.dart';
import 'package:tricares_doctor_app/features/home_layout/screens/home_layout.dart';

import '../../../../core/Global Cubit/global_cubit.dart';
import '../../../../core/InputField/custom_input/password_input_field.dart';
import '../../../../core/functions/fucntions.dart';
import '../../../../core/globle/color/shared_color.dart';
import '../../../../core/network/Local/CashHelper.dart';
import '../../../../core/utils/utils.dart';
import '../../../../generated/l10n.dart';
import '../../../profile/cubit/profile_cubit.dart';
import '../../cubit/auth_cubit.dart';
import '../Forget Password/forget_passwrod_screen.dart';
import '../Register/register_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late TextEditingController usernameController;
  late TextEditingController passwordController;

  @override
  void initState() {

    usernameController = TextEditingController();
    passwordController = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    usernameController.dispose();
    passwordController.dispose();
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
                width: width * 0.9,
                height: height * 0.18,
              ),
              SizedBox(
                height: height * 0.1,
              ),
              Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      S.of(context).login,
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                    Text(
                      S.of(context).loginMessage,
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            color: Colors.grey,
                          ),
                    ),
                    SizedBox(
                      height: height * 0.05,
                    ),
                    NameFiled(controller: usernameController),
                    SizedBox(
                      height: height * 0.02,
                    ),
                    PasswordFiled(
                      controller: passwordController,
                      hint: S.of(context).password,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                            onPressed: () {
                              navigateTo(context, const ForgetPasswordScreen());
                            },
                            child: Text(
                              S.of(context).forgetPassword,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(
                                    color: Colors.grey,
                                  ),
                            )),
                      ],
                    ),
                    SizedBox(
                      height: height * 0.01,
                    ),
                    LoginButton(
                        formKey: formKey,
                        usernameController: usernameController,
                        passwordController: passwordController),
                    SizedBox(
                      height: height * 0.08,
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    S.of(context).dontHaveAnAccount,
                    style: Theme.of(context).textTheme.titleMedium!,
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RegisterScreen()),
                          result: (route) => false);
                    },
                    child: Text(
                      S.of(context).apply,
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
                height: height * 0.06,
              ),
            ],
          ),
        ),
      ),
    ));
  }
}

class LoginButton extends StatelessWidget {
  final formKey;
  final TextEditingController usernameController;
  final TextEditingController passwordController;

  const LoginButton(
      {super.key,
      required this.formKey,
      required this.usernameController,
      required this.passwordController});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) async {
        if (state is LoginSuccess) {
          //context.loaderOverlay.hide();

          if (state.hasError) {
            var snackBar = Utils.buildSnackBar2(
                contentType: ContentType.failure,
                context: context,
                message: state.errors.join(' '));
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          } else {
            await CashHelper.prefs.setString('token', state.token!);

            CashHelper.prefs.setBool('login', true);

            context.read<ProfileCubit>().postUserData();
            context.read<GlobalCubit>().homeLayoutController.jumpToPage(0);
            context.read<GlobalCubit>().currentIndexScreen = 0;
            navigateToToFinish(context, const HomeLayoutScreen());

            var snackBar = Utils.buildSnackBar2(
                contentType: ContentType.success,
                context: context,
                message: state.messages.join(' '));
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
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
          child:  Text(S.of(context).login),
          onTap: (startLoading, stopLoading, btnState) async {
            if (formKey.currentState!.validate()) {
              if (btnState == ButtonState.idle) {
                startLoading();
                // call your network api
                await context.read<AuthCubit>().postLogin(
                      email: usernameController.text.trim(),
                      password: passwordController.text.trim(),
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
