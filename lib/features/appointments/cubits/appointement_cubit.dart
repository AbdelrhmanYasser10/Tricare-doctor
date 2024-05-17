import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:tricares_doctor_app/core/connection/internet_connection.dart';
import 'package:tricares_doctor_app/core/network/Local/CashHelper.dart';
import 'package:tricares_doctor_app/core/network/Remote/DioHelper.dart';
import 'package:tricares_doctor_app/core/network/endPoind.dart';

import '../models/schedule_model.dart';
part 'appointement_state.dart';

class AppointementCubit extends Cubit<AppointementState> {
  AppointementCubit() : super(AppointementInitial());


  static AppointementCubit get(context)=>BlocProvider.of(context);
  ScheduleModel? scheduleModel;
  ConnectionService _connectionService = ConnectionService();


  void getSchedule()async{
    emit(AppointementLoading());
    if(await _connectionService.isInternetConnected()) {
      DioHelper.postData(
          data: {},
          url: EndPoints.schedule,
          token: CashHelper.prefs.getString('token') ?? ""
      ).then((value) {
        if (value.statusCode == 200) {
          scheduleModel = ScheduleModel.fromJson(value.data);
          if (!scheduleModel!.hasError!) {
            emit(AppointementSuccess());
          }
          else {
            emit(AppointementError(message: scheduleModel!.errors!.join(' ')));
          }
        }
        else {
          emit(AppointementError(message: 'server'));
        }
      }).catchError((error) {
        emit(AppointementError(message: 'server'));
      });
    }
    else{
      emit(NoInternetConnection());
    }
  }

}
