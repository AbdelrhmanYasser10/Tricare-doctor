import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_btn/loading_btn.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:tricares_doctor_app/features/Authentication/screens/OTP/widget/timer.dart';
import '../../../../core/InputField/validation/input_validator.dart';
import '../../../../core/globle/color/shared_color.dart';
import '../../../../core/network/Local/CashHelper.dart';
import '../../../../core/utils/utils.dart';
import '../../cubit/auth_cubit.dart';

class OTPScreen extends StatelessWidget {
  final String code;
  final String phone;
  final String name;
  final String email;
  final String password;

   OTPScreen({
    super.key,
    required this.code,
    required this.phone,
    required this.name,
    required this.email,
    required this.password,
  });

  TextEditingController otpController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: BlocListener<AuthCubit, AuthState>(
        listener: (context, state) async {
          if (state is OTPSuccess) {
            if (state.hasError) {
              var snackBar = Utils.buildSnackBar2(
                contentType: ContentType.failure,
                context: context,
                message: state.errors.join(' '),
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            } else {
              CashHelper.prefs.setBool('login', true);
              await CashHelper.prefs.setString('token', state.token!);
              //context.read<AppCubit>().postUserData();

              // TODO
              Navigator.pop(context);
              Navigator.pop(context);


              var snackBar = Utils.buildSnackBar2(
                  contentType: ContentType.success,
                  context: context,
                  message: state.messages.join(' '));
              ScaffoldMessenger.of(context).showSnackBar(snackBar);

              // TODO HomeLayout Screen
              //  navigateToToFinish(context, HomeLayout());
            }
          }
        },
        child: SingleChildScrollView(
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
                    child: Image.asset('assets/images/otp.png'),
                  ),
                ),
                SizedBox(
                  height: height * 0.05,
                ),
                Text(
                  'OTP Verification',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                Text(
                  'Enter the verification code we just sent on your email address',
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(color: Colors.grey),
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                Form(
                  key: formKey,
                  child: Directionality(
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
                ),
                SizedBox(
                  height: height * 0.02,
                ),

                 TimerWidget(

                  name: name,
                  email: email,
                  phone: phone,
                  password: password,

                ),



                SizedBox(
                  height: height * 0.02,
                ),
                ConfirmButton(
                    formKey: formKey,
                    otpController: otpController,
                    code: code),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


class ConfirmButton extends StatelessWidget {
  final formKey;
  final TextEditingController otpController;
  final String code;

  const ConfirmButton(
      {super.key,
      required this.formKey,
      required this.otpController,
      required this.code});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Center(
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

              await context
                  .read<AuthCubit>()
                  .postEmailVerify(id: code, code: otpController.text.trim());

              stopLoading();
            }
          }
        },
      ),
    );
  }
}
