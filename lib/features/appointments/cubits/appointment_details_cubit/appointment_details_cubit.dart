import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:tricares_doctor_app/features/appointments/models/schedule_details_model.dart';

import '../../../../core/connection/internet_connection.dart';
import '../../../../core/network/Local/CashHelper.dart';
import '../../../../core/network/Remote/DioHelper.dart';
import '../../../../core/network/endPoind.dart';
import '../../models/schedule_update_model.dart';

part 'appointment_details_state.dart';

class AppointmentDetailsCubit extends Cubit<AppointmentDetailsState> {
  AppointmentDetailsCubit() : super(AppointmentDetailsInitial());

  static AppointmentDetailsCubit get(context)=>BlocProvider.of(context);

  ScheduleDetailsModel? details;
  ScheduleUpdateModel? updateModel;
  final ConnectionService _connectionService = ConnectionService();
  String timeSlotEnabled = "";
  void getDetails({required int id })async{
    emit(AppointmentDetailsLoading());
    if(await _connectionService.isInternetConnected()) {
      DioHelper.postData(
        data: {
          'id': id,
        },
        url: EndPoints.schedule,
        token: CashHelper.prefs.getString('token') ?? "",
      ).then((value) {
        if(value.statusCode == 200) {
          print(value.data);
          details = ScheduleDetailsModel.fromJson(value.data);
          if(!details!.hasError!){
            timeSlotEnabled = details!.data!.partnersSlot!.partslotStatus!;
            emit(AppointmentDetailsSuccess());
          }
          else{
            emit(AppointmentDetailsError(message: details!.messages!.join(' ')));
          }
        }
        else{
          emit(AppointmentDetailsError(message: 'server error'));
        }
      }).catchError((error) {
        emit(AppointmentDetailsError(message: error.toString()));
      });
    }
    else{
      emit(NoInternetConnection());
    }
  }

  Future<void> updateTimeSlotStatus({required String password , required int id }) async{
    if (await _connectionService.isInternetConnected()) {
    emit(TimeSlotUpdateLoading());

    await Future.delayed(const Duration(seconds: 1));

    await DioHelper.postData(
    data: {
    'id': id,
    'partners_slot_sec': "1",
    'activate': timeSlotEnabled == "2" ? 1 : 0,
    'password': password,

    },
    url: EndPoints.schedule,
    ).then((value) {
      updateModel = ScheduleUpdateModel.fromJson(value.data);
      print(value.data);
    emit(TimeSlotUpdateSuccessfully(
    hasError: updateModel!.hasError!,
    messages: updateModel!.messages!,
    errors: updateModel!.errors!,
    ));
    }).catchError((error) {
    emit(TimeSlotUpdateError(message: error.toString()));
    });
    }else {
    emit(NoInternetConnection());
    }
  }

}
