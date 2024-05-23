import 'package:flutter/material.dart';
import 'package:loading_btn/loading_btn.dart';


import '../../../../../core/globle/color/dark_app_color.dart';
import '../../../generated/l10n.dart';
import '../../InputField/custom_input/password_input_field.dart';
import '../../component/Loading Button/loading_button.dart';
import '../../globle/color/shared_color.dart';

class BuildProfileButton extends StatelessWidget {

  final GlobalKey<FormState> formKey;
  final String textButton;


  final Future<void> Function() futureFunction;
  BuildProfileButton({
    Key? key,
    required this.formKey,
    required this.textButton,

    required this.passwordController,
    required this.futureFunction,

  }) : super(key: key);

  final TextEditingController passwordController;

  final formPasswordKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return  ElevatedButton(
      onPressed: () {

        if( formKey.currentState!.validate()){
          passwordController.clear();
          showDialog(

              context: context,

              builder: (context){

                return SizedBox(
                  width: width,
                  child: AlertDialog(

                    surfaceTintColor: DarkAppColor.foreGroundColors,
                    title:   Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        S.of(context).urPassword,
                      ),
                    ),

                    content: Form(
                      key: formPasswordKey,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          PasswordFiled(controller: passwordController, hint: S.of(context).password),
                          SizedBox(height: height*0.02,),
                          SizedBox(width: width,),
                          LoadingButton(
                            text: S.of(context).send,
                            onTap: (startLoading, stopLoading, btnState) async {
                              if (formPasswordKey.currentState!.validate()) {
                                if (btnState == ButtonState.idle) {
                                  startLoading();
                                  FocusScope.of(context).unfocus();
                                  Navigator.pop(context);
                                  await futureFunction();

                                  stopLoading();
                                }
                              }
                            },
                          ),

                        ],
                      ),
                    ),
                  ),
                );
              }
          );

        }

      },
      style: ElevatedButton.styleFrom(
        minimumSize: Size(width, height * 0.06),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(120),
        ),
        backgroundColor: AppColor.primaryColor,
      ),
      child:  Text(textButton),
    );
  }
}
