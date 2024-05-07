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
import '../model/profile_model.dart';
import '../model/update_profile_model.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());

  File? image;
  ProfileModel? profileModel;
  UserModel? userModel;

  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var phoneController = TextEditingController();
  var typeController = TextEditingController();

  final _connect = ConnectionService();







  Future<void> postUserData()async{

    if( await CashHelper.getData(key: 'token') != ''){

      userModel = null;

      emit(GetUserDataLoading());

      DioHelper.postData(
        data: {},
        url: EndPoints.verify_accessToken_request,
        token:  CashHelper.getData(key: 'token')??'',
      ).then((value) async {



        userModel = UserModel.formJson(value.data);
        if(!userModel!.hasError){
          nameController.text = userModel!.data!.patient!.patientFullname!;
          emailController.text = userModel!.data!.patient!.patientEmail!;
        }

        image = null;
        emit(GetUserDataSuccess(
          hasError: userModel!.hasError,
          errors: userModel!.errors,
          messages: userModel!.messages,
          token: userModel!.data!.patient!.patientAccesstoken,
        ));
      }).catchError((error){
        print(error.toString());
        emit(GetUserDataError());
      });

    }

  }




  void logOut(){
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
    required String country,
    required String timeZone,
    required String type,
    required String phone,
    required String password,
  }) async {
    FormData formData = FormData.fromMap({
      'patient_fullname': name,
      'patient_email': email,
      'patient_phone': phone,
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


    if(await _connect.isInternetConnected()){

      emit(ChangeProfileLoading());

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

      }).catchError((error){

        debugPrint(error.toString());
        emit(ChangeProfileError());

      });

    }
    else
    {
      emit(NoInternetConnection());
    }

    }












}
