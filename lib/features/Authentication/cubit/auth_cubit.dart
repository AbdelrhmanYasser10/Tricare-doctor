import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tricares_doctor_app/features/Authentication/models/Register_model.dart';
import 'package:tricares_doctor_app/features/Authentication/models/login_model.dart';

import '../../../core/connection/internet_connection.dart';
import '../../../core/network/Remote/DioHelper.dart';
import '../../../core/network/endPoind.dart';
import '../models/countries_model.dart';
import '../models/forget_password_model.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  static AuthCubit get(context)=>BlocProvider.of(context);

  final ConnectionService _connectivity = ConnectionService();
  LoginModel? loginModel;
  RegisterModel? registerModel;
  ForgetPasswordModel? forgetPasswordModel;
  FilePickerResult? result;
  List<XFile> xFiles = [];
  List<CountriesModel> allCounties = [
    CountriesModel(label: "N/A", value: "N/A"),
  ];


  Future<void> attachFile() async{
    emit(PickFilesLoading());
    result = await FilePicker.platform.pickFiles(allowMultiple: true);
    if (result != null) {
      List<XFile> files = result!.xFiles;
      for(var elements in files){
        bool founded = false;
        for(var element2 in xFiles){
          if(elements.name == element2.name){
            founded =true;
            break;
          }
        }
        if(founded){
          continue;
        }
        xFiles.add(elements);
      }
      emit(PickFilesSuccessfully());
    } else {
      emit(PickFilesError());
    }

  }

  void removeFile({required int index}){
    xFiles.removeAt(index);
    emit(RemoveFile());
  }

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
          token: "",
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

  Future<void> postRegister({
    required email,
    required phone,
    required name,
    required bool isDoctor,
    String? phone2,
    String? title,
    String? subTitle,
    int? gender,
    String? country,
  }) async {

    if(await _connectivity.isInternetConnected()){
      emit(RegisterLoading());
      if(isDoctor) {
        List<MultipartFile> allFiles = [];
        if (xFiles.isNotEmpty) {
          for (var element in xFiles) {
            allFiles.add(
              await MultipartFile.fromFile(
                element.path,
                filename: element.path
                    .split("/")
                    .last,
              ),
            );
          }
        }
        FormData data = FormData.fromMap(
            {
              'contact_fullname': name,
              'contact_email': email,
              'contact_phone': phone,
              'contact_subject': title,
              'contact_message': subTitle,
              'attachment': xFiles,
            }
        );
        await DioHelper.postDataFile(
          data: data,
          url: EndPoints.doctor_apply,
        ).then((value) {
          print(value.data);
          registerModel = RegisterModel.formJson(value.data);
          emit(RegisterSuccess(
            hasError: registerModel!.hasError,
            messages: registerModel!.messages,
            errors: registerModel!.errors,
          ),
          );
        }).catchError((error) {
          print(error.toString());
          emit(RegisterError());
        });
      }
      else{
        await DioHelper.postData(
          data: {
            'application_fullname':name,
            'application_email':email,
            'application_phone':phone,
            'application_phone_2':phone2,
            'application_gender':gender.toString(),
            'application_country':country,
          },
          url: EndPoints.investor_apply,
        ).then((value) {
          print(value.data);
          registerModel = RegisterModel.formJson(value.data);
          emit(RegisterSuccess(
            hasError: registerModel!.hasError,
            messages: registerModel!.messages,
            errors: registerModel!.errors,
          ),
          );
        }).catchError((error) {
          print(error.toString());
          emit(RegisterError());
        });
      }
    }
    else
    {
     emit(NoInterNetConnection());
    }


  }


 /* Future<void> postEmailVerify({required String id,required String code})async{

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


  }*/


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
           uniqueId: "",
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

  Future<void> getAllCountries() async{
    if(await _connectivity.isInternetConnected()){
      emit(AllCountriesLoading());

      await DioHelper.getData(
        url: EndPoints.countries,
      ).then((value) {

        if(!value.data["hasError"]){
          allCounties = [];
          value.data["data"]["countries"].forEach(
              (element){
                allCounties.add(CountriesModel.fromJson(element));
              }
          );
          emit(AllCountriesSuccess());
        }
        else{
          allCounties = [
            CountriesModel(label: "N/A", value: "N/A"),

          ];
          emit(AllCountriesError());
        }
      }).catchError((error) {
        allCounties = [
          CountriesModel(label: "N/A", value: "N/A"),

        ];
        print(error.toString());
        emit(RegisterError());
      });
    }
    else
    {
      emit(NoInterNetConnection());
    }
  }


}
