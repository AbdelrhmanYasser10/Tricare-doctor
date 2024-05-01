import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:tricares_doctor_app/features/Authentication/models/Register_model.dart';
import 'package:tricares_doctor_app/features/Authentication/models/login_model.dart';

import '../../../core/connection/internet_connection.dart';
import '../../../core/network/Remote/DioHelper.dart';
import '../../../core/network/endPoind.dart';
import '../models/forget_password_model.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  final ConnectionService _connectivity = ConnectionService();
  LoginModel? loginModel;
  RegisterModel? registerModel;
  ForgetPasswordModel? forgetPasswordModel;

  Future<void> postLogin({required String email, required String password}) async {
    if (await _connectivity.isInternetConnected()) {
      emit(LoginLoading());

      await DioHelper.postData(
        data: {
          'login_email': email,
          'login_password': password,
        },
        url: EndPoints.login_request,
      ).then((value) {
        loginModel = LoginModel.formJson(value.data);

        emit(LoginSuccess(
          hasError: loginModel!.hasError,
          errors: loginModel!.errors,
          messages: loginModel!.messages,
          token: loginModel!.hasError ? null : loginModel!.data!.patient!.patientAccesstoken,
        ));
      }).catchError((error) {
        debugPrint(error.toString());
        emit(LoginError());
      });
    }
    else
    {

      emit(NoInterNetConnection());
    }
  }

  Future<void> postRegister({required email, required phone, required password, required name,}) async {

    if(await _connectivity.isInternetConnected()){
      emit(RegisterLoading());
     await DioHelper.postData(
        data: {
          'accept_tos': 1,
          'patient_email': email,
          'patient_phone': phone,
          'patient_fullname': name,
          'patient_password': password,
        },
        url: EndPoints.register_request,
      ).then((value) {

        registerModel = RegisterModel.formJson(value.data);
        emit(RegisterSuccess(
          hasError: registerModel!.hasError,
          messages: registerModel!.messages,
          errors:  registerModel!.errors,
          code: registerModel!.hasError? '': registerModel!.data!.patientUniqueId,
        ),
        );
      }).catchError((error) {
        emit(RegisterError());
        print(error.toString());
      });
    }
    else
    {
     emit(NoInterNetConnection());
    }


  }


  Future<void> postEmailVerify({required String id,required String code})async{

    if(await _connectivity.isInternetConnected()){
      emit(OTPLoading());

      await  DioHelper.postData(
        data: {

          'patient_uniqueid': id,
          'patient_vcode': code,

        },
        url: EndPoints.registerVerify_Request,
      ).then((value){
        print(value.data);
        loginModel = LoginModel.formJson(value.data);
        if(loginModel!.hasError){
          emit(OTPSuccess(hasError: loginModel!.hasError,messages: loginModel!.messages,errors: loginModel!.errors,token: null));
        }
        else
        {
          emit(OTPSuccess(hasError: loginModel!.hasError,messages: loginModel!.messages,errors: loginModel!.errors,token:loginModel!.data!.patient!.patientAccesstoken!));
        }

      });
    }
    else {
      emit(NoInterNetConnection());
    }


  }


  Future<void> postForgetPassword({required String email})async{

   if(await _connectivity.isInternetConnected()){
     emit(ForgetPasswordLoading());

     await DioHelper.postData(
       url: EndPoints.forgetPassword_request,
       data: {
         'patient_email': email,
       },
     ).then((value){

       forgetPasswordModel = ForgetPasswordModel.formJson(value.data);

       emit(
         ForgetPasswordSuccess(
           hasError: forgetPasswordModel!.hasError,
           messages: forgetPasswordModel!.messages,
           errors: forgetPasswordModel!.errors,
           uniqueId: forgetPasswordModel!.hasError?'':forgetPasswordModel!.data!.patient_uniqueid,
         ),
       );


     }).catchError((error){
       emit(ForgetPasswordError());
     });
   }
   else{
     emit(NoInterNetConnection());
   }



  }


  Future<void> postResend({required String email})async{



    await DioHelper.postData(
      url: EndPoints.forgetPassword_request,
      data: {
        'patient_email': email,
      },
    ).then((value){

      forgetPasswordModel = ForgetPasswordModel.formJson(value.data);




    }).catchError((error){
      emit(ForgetPasswordError());
    });



  }


  Future<void> postRestPassword({required String id,required String code,required password})async{

     if(await _connectivity.isInternetConnected())
     {
       emit(ResetPasswordLoading());

       await  DioHelper.postData(
         data: {

           'patient_uniqueid': id,
           'patient_reset_vcode': code,
           'patient_password': password,
         },

         url: EndPoints.resetPassword_request,

       ).then((value){
         loginModel = LoginModel.formJson(value.data);
         emit(ResetPasswordSuccess(
           hasError: loginModel!.hasError,
           errors: loginModel!.errors,
           messages: loginModel!.messages,
           token: loginModel!.hasError? '': loginModel!.data!.patient!.patientAccesstoken,
         ));
       }
       );
     }
     else
     {
      emit(NoInterNetConnection());
     }

  }


  Future<void> postResendRegister({required email, required phone, required password, required name,}) async {

    if(await _connectivity.isInternetConnected()){
      emit(ResendRegisterLoading());
      await DioHelper.postData(
        data: {
          'accept_tos': 1,
          'patient_email': email,
          'patient_phone': phone,
          'patient_fullname': name,
          'patient_password': password,
        },
        url: EndPoints.register_request,
      ).then((value) {

        registerModel = RegisterModel.formJson(value.data);
        emit(ResendRegisterSuccess());
      }).catchError((error) {
        emit(ResendRegisterError());
        print(error.toString());
      });
    }
    else
    {
      emit(NoInterNetConnection());
    }


  }


}
