import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:tricares_doctor_app/features/appointments/models/my_available_appointements_model.dart';

import '../models/schedule_appointements_model.dart';

part 'appointement_state.dart';

class AppointementCubit extends Cubit<AppointementState> {
  AppointementCubit() : super(AppointementInitial());

  MyAppointementModel? myAppointementModel;
  ScheculeAppointementsModel scheculeAppointementsModel = ScheculeAppointementsModel(schedule_sec: '1');


  void addNewTimeOrDay({required int dayIndex , required String time}){
    switch(dayIndex){
      case 0:
        scheculeAppointementsModel.satDayTimes.add(time);
        break;
      case 1:
        scheculeAppointementsModel.sunDayTimes.add(time);
        break;
      case 2:
        scheculeAppointementsModel.monDayTimes.add(time);
        break;
      case 3:
        scheculeAppointementsModel.tueDayTimes.add(time);
        break;
      case 4:
        scheculeAppointementsModel.wedDayTimes.add(time);
        break;
      case 5:
        scheculeAppointementsModel.thursDayTimes.add(time);
        break;
      case 6:
        scheculeAppointementsModel.friDayTimes.add(time);
        break;
    }
    emit(AddNewTimeOrDay());
  }
  void removeTimeOrDay({required bool removeAll , required String time , required int dayIndex}){
    switch(dayIndex){
      case 0:
        if(removeAll) {
          scheculeAppointementsModel.satDayTimes.clear();
        } else {
          scheculeAppointementsModel.satDayTimes.firstWhere((element) => element == time);
        }
        break;
      case 1:
        if(removeAll) {
          scheculeAppointementsModel.satDayTimes.clear();
        } else {
          scheculeAppointementsModel.satDayTimes.firstWhere((element) => element == time);
        }
        break;
      case 2:
        if(removeAll) {
          scheculeAppointementsModel.satDayTimes.clear();
        } else {
          scheculeAppointementsModel.satDayTimes.firstWhere((element) => element == time);
        }
        break;
      case 3:
        if(removeAll) {
          scheculeAppointementsModel.satDayTimes.clear();
        } else {
          scheculeAppointementsModel.satDayTimes.firstWhere((element) => element == time);
        }
        break;
      case 4:
        if(removeAll) {
          scheculeAppointementsModel.satDayTimes.clear();
        } else {
          scheculeAppointementsModel.satDayTimes.firstWhere((element) => element == time);
        }
        break;
      case 5:
        if(removeAll) {
          scheculeAppointementsModel.satDayTimes.clear();
        } else {
          scheculeAppointementsModel.satDayTimes.firstWhere((element) => element == time);
        }
        break;
      case 6:
        if(removeAll) {
          scheculeAppointementsModel.satDayTimes.clear();
        } else {
          scheculeAppointementsModel.satDayTimes.firstWhere((element) => element == time);
        }
        break;
    }
    emit(AddNewTimeOrDay());

  }
  void getDoctorAppointments(){




  }

  void updateDoctorAppointments(){

  }
}
