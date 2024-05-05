import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../core/connection/internet_connection.dart';
import '../../../core/network/Remote/DioHelper.dart';
import '../../../core/network/endPoind.dart';
import '../model/about_us_model.dart';
import '../model/setting_model.dart';
import '../model/tos_model.dart';

part 'drawer_state.dart';

class DrawerCubit extends Cubit<DrawerState> {
  DrawerCubit() : super(DrawerInitial());

  SettingModel? settingModel;
  TosModel? tosModel;
  AboutUsModel? aboutUsModel;
  final _connect = ConnectionService();



  Future<void> getSettingData() async {

    if(await _connect.isInternetConnected()){
      if(settingModel == null){
        emit(GetSettingDataLoading());

        await DioHelper.getData(

          url: EndPoints.setting_request,

        ).then((value) {

          settingModel = SettingModel.formJson(value.data);
          emit(GetSettingDataSuccess());
        }).catchError((error) {
          print(error.toString());
          emit(GetSettingDataError());
        });
      }
    }
    else
      {
        emit(NoInternetConnection());
      }


  }


  Future<void> getTosData() async {

    if(await _connect.isInternetConnected()){
      if(tosModel == null){
        emit(GetTosLoading());

        await DioHelper.getData(

          url: EndPoints.tos_request,

        ).then((value) {
          tosModel = TosModel.formJson(value.data);
          emit(GetTosSuccess());
        }).catchError((error) {
          print(error.toString());
          emit(GetTosError());
        });
      }
    }
    else
    {
      emit(NoInternetConnection());
    }

  }


  Future<void> getAboutUsData() async {

    if(await _connect.isInternetConnected()){

      if(aboutUsModel == null){
        emit(GetAboutUsLoading());

        await DioHelper.getData(

          url: EndPoints.about_request,

        ).then((value) {

          aboutUsModel = AboutUsModel.formJson(value.data);
          emit(GetAboutUsSuccess());
        }).catchError((error) {
          print(error.toString());
          emit(GetAboutUsError());
        });
      }

    }
    else
    {
      emit(NoInternetConnection());
    }


  }




}
