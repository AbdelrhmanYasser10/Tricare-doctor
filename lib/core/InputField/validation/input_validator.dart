import 'package:flutter/material.dart';

class InputValidator{

  final BuildContext context;

  InputValidator(this.context);


  String?  emailValidator(String? value){

    if(value == null || value.isEmpty) {
      return 'Please Enter Your Email';
    }

    return null;

  }

  String?  subjectValidator(String? value){

    if(value == null || value.isEmpty) {
      return 'Please Enter Your Request Subject';
    }

    return null;

  }
  String?  amount(String? value){

    if(value == null || value.isEmpty) {
      return 'Please Enter Your Request Amount';
    }

    return null;

  }
  String?  subjectMessageValidator(String? value){

    if(value == null || value.isEmpty) {
      return 'Please Enter Your Message';
    }

    return null;

  }

  String?  phoneValidator(String? value){

    if(value == null || value.isEmpty) {
      return null;
    } else if(value.length < 11 || value.length > 11) {
      return 'Phone Must Be 11 Number';
    }

    return null;

  }

  String? whatsPhoneValidator(String? value){

    if(value == null || value.isEmpty) {
      return null;
    } else if(value.length < 11 || value.length > 11) {
      return 'Phone Must Be 11 Number';
    }

    return null;

  }


  String?  nameValidator(String? value){

    if(value == null || value.isEmpty) {
      return 'Please Enter Your Name';
    }

    return null;

  }


  String?  otpValidator(String? value){

    if(value == null || value.isEmpty) {
      return 'Please Enter Your Verification Code';
    }
    return null;

  }


  String?  passwordValidator(String? value){

    if(value == null || value.isEmpty) {
      return 'Please Enter Your Password';
    }
    else if(value.length < 6) {
      return 'Password is to week';
    }

    return null;

  }


}