import 'dart:io';
import 'package:dio/dio.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';
import 'package:http_parser/src/media_type.dart';


import '../../../core/connection/internet_connection.dart';
import '../../../core/network/Local/CashHelper.dart';
import '../../../core/network/Remote/DioHelper.dart';
import '../../../core/network/endPoind.dart';
import '../../../generated/l10n.dart';
import '../../Authentication/models/countries_model.dart';
import '../../Rooms/screens/rooms_screen.dart';
import '../../appointments/screens/appointments_screen.dart';
import '../../profits/screens/profits_screen.dart';
import '../../sessions/screens/sessions_screen.dart';
import '../model/change_password_model.dart';
import '../model/delete_profile_model.dart';
import '../model/profile_model.dart';
import '../model/update_profile_model.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());
  static ProfileCubit get(context)=>BlocProvider.of(context);
  File? image;
  ProfileModel? profileModel;
  UserModel? userModel;
  ChangePasswordModel? changePasswordModel;
  DeleteModel? deleteModel;
  final ConnectionService _connectivity = ConnectionService();
  int typeGender = 0;
  List<CountriesModel> allCounties = [
    CountriesModel(label: "N/A", value: "N/A"),
  ];
  late List<String> categoriesName;

  late List<Widget> screens;

  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var phoneController = TextEditingController();
  var whatsappPhoneController = TextEditingController();
  String country = "N/A";
  String whatsappEnabled = "0";


  final _connect = ConnectionService();


  Future<void> postUpdateTokenFcm({required String tokenFcm})async{
    emit(GetUpdateTokenFcmLoading());

    DioHelper.postData(
      data: {

        'partner_firebase_accesstoken' : tokenFcm,

      },
      url: 'partner_firebase_token.php',
      token: CashHelper.getData(key: 'token'),
    ).then((value){

      emit(GetUpdateTokenFcmSuccess());

    }).catchError((error){
      emit(GetUpdateTokenFcmError());

    });
  }

  Future<void> postUserData({bool notification = false}) async {
    if(notification == false) {
      userModel = null;
    }

    emit(GetUserDataLoading());

    await Future.delayed(const Duration(seconds: 1));

    DioHelper.postData(
      data: {},
      url: EndPoints.verify_accessToken_request,
      token: CashHelper.getData(key: 'token') ?? '',
    ).then((value) async {
      userModel = UserModel.formJson(value.data);
      print(userModel!.hasError);
      if (!userModel!.hasError) {
        nameController.text = userModel!.data!.partner!.partnerFullname!;
        emailController.text = userModel!.data!.partner!.partnerEmail!;
        phoneController.text = userModel!.data!.partner!.partnerPhone!;
        whatsappPhoneController.text = userModel!.data!.partner!.partnerWhatsappNumber!;
        whatsappEnabled = userModel!.data!.partner!.partnerWhatsappEnabled!;
        typeGender = int.parse(userModel!.data!.partner!.partnerGender!);
        await getAllCountries();
        country = userModel!.data!.partner!.partnerCountry!;

      } else {
        logOut();
      }

      image = null;
      categoriesName =  [
        userModel!.data!.partner!.partnerDoctor == "1"
            ? S.current.schedule
            : '',
        userModel!.data!.partner!.partnerDoctor == "1"
            ? S.current.session
            : '',
        userModel!.data!.partner!.partnerInvestor == "1"
            ? S.current.rooms
            : '',
        S.current.profits,
      ];
      screens =  const[
        AppointmentsScreen(),
        SessionsScreen(
          fromHome: true,
        ),
        RoomsScreen(),
        ProfitsScreen(),
      ];
      print("I am here");
      if( await CashHelper.getData(key: 'tokenNotification') == null){
        print("Save token");
        postUpdateTokenFcm(tokenFcm: await CashHelper.getData(key: 'tokenNotification'));

      }
      else if(await CashHelper.getData(key: 'tokenNotification')  != null){
        if(await CashHelper.getData(key: 'tokenNotification')  != userModel!.data!.partner!.partnerAccesstoken) {
          postUpdateTokenFcm(
              tokenFcm: await CashHelper.getData(key: 'tokenNotification'));
        }
      }

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
    required String phone,
    required String country,
    required String whatsapp,
    required int whatsappEnabled,
    required String password,
  }) async {
    // FormData formData = FormData.fromMap();

    if (await _connect.isInternetConnected()) {
      emit(ChangeProfileLoading());

      await Future.delayed(const Duration(seconds: 1));

      await DioHelper.postData(
        data: {
          'partner_username': name,
          'partner_gender':typeGender,
          'partner_email': email,
          'partner_phone': phone,
          'password': password,
          'partner_whatsapp_number': whatsapp,
          'partner_timezone': '+02:00',
          'partner_country': country,
          'partner_whatsapp_enabled': whatsappEnabled,
        },
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

  Future<void> changeProfilePicture({required String password}) async {
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


  }


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
        emit(AllCountriesError());
      });
    }
    else
    {
      emit(NoInterNetConnection());
    }
  }



}
