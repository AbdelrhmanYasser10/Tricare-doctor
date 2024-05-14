import 'dart:io';
import 'package:dio/dio.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';
import 'package:http_parser/src/media_type.dart';


import '../../../core/connection/internet_connection.dart';
import '../../../core/network/Local/CashHelper.dart';
import '../../../core/network/Remote/DioHelper.dart';
import '../../../core/network/endPoind.dart';
import '../model/change_password_model.dart';
import '../model/delete_profile_model.dart';
import '../model/profile_model.dart';
import '../model/update_profile_model.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());

  File? image;
  ProfileModel? profileModel;
  UserModel? userModel;
  ChangePasswordModel? changePasswordModel;
  DeleteModel? deleteModel;

  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var phoneController = TextEditingController();

  int typeGender = 0;

  final _connect = ConnectionService();

  Future<void> postUserData() async {
    userModel = null;

    emit(GetUserDataLoading());

    await Future.delayed(const Duration(seconds: 1));

    DioHelper.postData(
      data: {},
      url: EndPoints.verify_accessToken_request,
      token: CashHelper.getData(key: 'token') ?? '',
    ).then((value) async {
      userModel = UserModel.formJson(value.data);
      print("herreee!!!");
      print(userModel!.hasError);
      if (!userModel!.hasError) {
        nameController.text = userModel!.data!.partner!.partnerFullname!;
        emailController.text = userModel!.data!.partner!.partnerEmail!;
        phoneController.text = userModel!.data!.partner!.partnerPhone!;
        typeGender = int.parse("1");
      } else {
        logOut();
      }

      image = null;
      emit(GetUserDataSuccess(
        hasError: userModel!.hasError,
        errors: userModel!.errors,
        messages: userModel!.messages,
        token:userModel!.data !=null ? userModel!.data!.partner!.partnerAccesstoken! : '',
      ));
    }).catchError((error) {
      print(error.toString());
      emit(GetUserDataError());
    });
  }

  void logOut() {
    CashHelper.prefs.remove('token');
    CashHelper.prefs.remove('login');
    nameController.clear();
    userModel = null;
    emit(LogOutState());
  }

  Future pickImage(ImageSource source) async {
    try {
      final myImage = await ImagePicker().pickImage(
        source: source,
      );
      if (myImage == null) return;

      image = await _cropImage(imageFile: File(myImage.path));

      emit(ImagePickerSuccess());
    } on PlatformException catch (error) {
      print(error);
    }
  }

  Future<File?> _cropImage({required File imageFile}) async {
    try {
      CroppedFile? croppedImage =
          await ImageCropper().cropImage(sourcePath: imageFile.path);
      if (croppedImage == null) return null;
      return File(croppedImage.path);
    } catch (error) {
      debugPrint(error.toString());
      return null;
    }
  }

  Future<void> updateProfile({
    required String name,
    required String email,
    required String timeZone,
    required String type,
    required String phone,
    required String password,
  }) async {
    FormData formData = FormData.fromMap({
      'patient_fullname': name,
      'partner_email': email,
      'partner_phone': phone,
      'password': password,
      'patient_timezone': timeZone,
      'patient_gender': type,
      'patient_profilepicture_file': image == null
          ? ''
          : await MultipartFile.fromFile(
              image!.path,
              filename: image!.path.split('/').last,
              contentType: MediaType.parse('multipart/form-data'),
            ),
    });

    if (await _connect.isInternetConnected()) {
      emit(ChangeProfileLoading());

      await Future.delayed(const Duration(seconds: 1));

      await DioHelper.postDataFile(
        data: formData,
        url: EndPoints.updateProfile_request,
      ).then((value) {
        profileModel = ProfileModel.formJson(value.data);

        emit(ChangeProfileSuccess(
          hasError: profileModel!.hasError,
          messages: profileModel!.messages,
          errors: profileModel!.errors,
        ));
      }).catchError((error) {
        debugPrint(error.toString());
        emit(ChangeProfileError());
      });
    } else {
      emit(NoInternetConnection());
    }
  }

/*  Future<void> changeProfilePicture({required String password}) async {
    emit(ChangeProfilePictureLoading());
    await   Future.delayed(const Duration(seconds: 1));


    FormData formData = FormData.fromMap({
      'password': password,
      'patient_profilepicture_file': image == null
          ? ''
          : await MultipartFile.fromFile(
              image!.path,
              filename: image!.path.split('/').last,
              contentType: MediaType.parse('multipart/form-data'),
            ),
    });

    if(! await _connect.isInternetConnected()) return emit(NoInternetConnection());



    DioHelper.postDataFile(
      data: formData,
      url: EndPoints.changeProfilePicture_request,
    ).then((value) {

      profileModel = ProfileModel.formJson(value.data);
      emit(
          ChangeProfilePictureSuccess(
            hasError: profileModel!.hasError,
            messages: profileModel!.messages,
            errors: profileModel!.errors,
          ));

    }).catchError((error){
      debugPrint(error.toString());
      emit(ChangeProfilePictureError());
    });


  }*/


  Future<void> changePassword({
    required String currentPassword,
    required String newPassword,
    required String  confirmPassword
  })async{
    emit(ChangePasswordLoading());
    await Future.delayed(const Duration(seconds: 1));
    await DioHelper.postData(
      data: {
        'password' : currentPassword,
        'new_password' : newPassword,
        'new_password2' : confirmPassword,

      },
      url: EndPoints.changePassword_request,
      token: CashHelper.getData(key: 'token'),
    ).then((value){

      changePasswordModel = ChangePasswordModel.fromJson(value.data);
      emit(ChangePasswordSuccess(
        hasError: changePasswordModel!.hasError!,
        message: changePasswordModel!.messages!,
        error: changePasswordModel!.errors!,

      ));
    }).catchError((error){
      print(error.toString());
      emit(ChangePasswordError());
    });


  }


  Future<void> postDeleteAccount({required String password}) async {
    emit(DeleteAccountLoading());
    await Future.delayed(const Duration(seconds: 1));

    await DioHelper.postData(
      data: {
        'password' : password,
      },
      url: EndPoints.deleteAccount_request,
      token: CashHelper.getData(key: 'token'),
    ).then((value) {
      deleteModel = DeleteModel.fromJson(value.data);

      if(deleteModel!.hasError == false){

        logOut();

      }


      emit(DeleteAccountSuccess(
        errors: deleteModel!.errors!,
        messages: deleteModel!.messages!,
        hasError: deleteModel!.hasError!,
      ));
    }).catchError((error){
      print(error.toString());
      emit(DeleteAccountError());
    });
  }




}
