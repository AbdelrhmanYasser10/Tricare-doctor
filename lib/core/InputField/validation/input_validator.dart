import 'package:flutter/material.dart';

import '../../../generated/l10n.dart';

class InputValidator{

  final BuildContext context;

  InputValidator(this.context);


  String?  emailValidator(String? value){

    if(value == null || value.isEmpty) {
      return S.current.emailValidation;
    }

    return null;

  }

  String?  subjectValidator(String? value){



    return null;

  }
  String?  amount(String? value){

    if(value == null || value.isEmpty) {
      return S.current.amountValidation;
    }

    return null;

  }
  String?  subjectMessageValidator(String? value){

    if(value == null || value.isEmpty) {
      return S.current.messageValidation;
    }

    return null;

  }

  String?  phoneValidator(String? value){

    if(value == null || value.isEmpty) {
      return null;
    } else if(value.length < 11 || value.length > 11) {
      return S.current.phoneValidation;
    }

    return null;

  }

  String? whatsPhoneValidator(String? value){

    if(value == null || value.isEmpty) {
      return null;
    } else if(value.length < 11 || value.length > 11) {
      return S.current.phoneValidation;
    }

    return null;

  }


  String?  nameValidator(String? value){

    if(value == null || value.isEmpty) {
      return S.current.nameValidation;
    }

    return null;

  }


  String?  otpValidator(String? value){

    if(value == null || value.isEmpty) {
      return S.current.otpValidation;
    }
    return null;

  }


  String?  passwordValidator(String? value){

    if(value == null || value.isEmpty) {
      return S.current.passwordValidation;
    }
    else if(value.length < 6) {
      return S.current.weakPassword;
    }

    return null;

  }


}