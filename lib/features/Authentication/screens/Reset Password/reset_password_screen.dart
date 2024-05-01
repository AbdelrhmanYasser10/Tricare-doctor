import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_btn/loading_btn.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../../core/InputField/custom_input/password_input_field.dart';
import '../../../../core/InputField/validation/input_validator.dart';
import '../../../../core/globle/color/shared_color.dart';
import '../../../../core/network/Local/CashHelper.dart';
import '../../../../core/utils/utils.dart';
import '../../cubit/auth_cubit.dart';

class ResetPasswordScreen extends StatefulWidget {
  final String studentUniqueId;
  final String email;

  ResetPasswordScreen(
      {super.key, required this.studentUniqueId, required this.email});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  late TextEditingController passwordController;
  late TextEditingController otpController;
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    passwordController = TextEditingController();
    otpController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    passwordController.dispose();
    otpController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.03),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: SizedBox(
                    child: Image.asset('assets/images/otp.png'),
                  ),
                ),
                Text(
                  'Enter the verification code we just sent on your email address after that put your new password.',
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(),
                ),
                SizedBox(
                  height: height * 0.05,
                ),
                Directionality(
                  textDirection: TextDirection.ltr,
                  child: PinCodeTextField(
                    controller: otpController,
                    length: 6,
                    autoFocus: false,
                    cursorColor: AppColor.primaryColor,
                    keyboardType: TextInputType.number,
                    obscureText: false,
                    animationType: AnimationType.scale,
                    pinTheme: PinTheme(
                      shape: PinCodeFieldShape.box,
                      borderRadius: BorderRadius.circular(10),
                      fieldHeight: 50,
                      fieldWidth: 50,
                      borderWidth: 1.0,
                      activeColor: AppColor.primaryColor,
                      inactiveColor: Colors.grey,
                      inactiveFillColor: Colors.transparent,
                      activeFillColor: Colors.transparent,
                      selectedColor: AppColor.primaryColor,
                      selectedFillColor: Colors.transparent,
                    ),
                    animationDuration: const Duration(milliseconds: 300),
                    enableActiveFill: true,
                    backgroundColor: Colors.transparent,
                    validator: InputValidator(context).otpValidator,
                    onChanged: (value) {},
                    beforeTextPaste: (text) {
                      return true;
                    },
                    appContext: context,
                  ),
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                PasswordFiled(
                  controller: passwordController,
                  hint: 'New Password',
                ),

                SizedBox(
                  height: height * 0.04,
                ),
                ConfirmButton(
                  studentUniqueId: widget.studentUniqueId,
                  formKey: formKey,
                  otpController: otpController,
                  passwordController: passwordController,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ConfirmButton extends StatelessWidget {
  final String studentUniqueId;
  final formKey;
  final TextEditingController otpController;
  final TextEditingController passwordController;

  const ConfirmButton({
    super.key,
    required this.studentUniqueId,
    required this.formKey,
    required this.otpController,
    required this.passwordController,
  });

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return BlocListener<AuthCubit, AuthState>(
  listener: (context, state) async {
    if(state is ResetPasswordSuccess){
      if(state.hasError){
        var snackBar = Utils.buildSnackBar2(
          context: context,
          contentType: ContentType.failure,

          message: state.errors.join(' '),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
      else
      {


        CashHelper.prefs.setBool( 'login',  true);
        await CashHelper.prefs.setString( 'token', state.token!);

        //context.read<AppCubit>().postUserData();

        // // TODO
        Navigator.pop(context);
        Navigator.pop(context);
        Navigator.pop(context);


        var snackBar = Utils.buildSnackBar2(
          context: context,
          contentType: ContentType.success,
          message: state.messages.join(' '),
        );
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
        child: const Text("Confirm"),
        onTap: (startLoading, stopLoading, btnState) async {
          if (formKey.currentState!.validate()) {
            if (btnState == ButtonState.idle) {
              startLoading();

              await context.read<AuthCubit>().postRestPassword(
                    id: studentUniqueId,
                    code: otpController.text.trim(),
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
