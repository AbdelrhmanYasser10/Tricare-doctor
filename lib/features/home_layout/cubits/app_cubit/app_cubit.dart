import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../../core/connection/internet_connection.dart';
import '../../../../core/network/Remote/DioHelper.dart';
import '../../../../core/network/endPoind.dart';
import '../../../home/models/home_model.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppInitial());
  static AppCubit get(context) => BlocProvider.of(context);

  final _connect = ConnectionService();

  HomeModel? homeModel;

  Future<void> getHomeData() async {


    emit(GetHomeDataLoading());
    await Future.delayed(const Duration(seconds: 1));
    if(await _connect.isInternetConnected()){


      await DioHelper.getData(

        url: EndPoints.home_request,
      ).then((value) {

        homeModel = HomeModel.formJson(value.data);
        emit(GetHomeDataSuccess());
      }).catchError((error) {
        print(error.toString());
        emit(GetHomeDataError());
      });
    }
    else
    {
      emit(NoInternetConnectionHome());
    }

  }
}
