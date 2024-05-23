import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:tricares_doctor_app/core/connection/internet_connection.dart';
import 'package:tricares_doctor_app/core/network/Local/CashHelper.dart';
import 'package:tricares_doctor_app/core/network/endPoind.dart';
import 'package:tricares_doctor_app/features/sessions/models/session_details_model.dart';

import '../../../../core/network/Remote/DioHelper.dart';

part 'session_details_state.dart';

class SessionDetailsCubit extends Cubit<SessionDetailsState> {
  SessionDetailsCubit() : super(SessionDetailsInitial());

  static SessionDetailsCubit get(context)=>BlocProvider.of(context);

  SessionDetailsModel? sessionDetailsModel;

  final ConnectionService _connectionService = ConnectionService();

  void getSessionDetails({required int sessionId})async{
    emit(SessionDetailsLoading());
    if(await _connectionService.isInternetConnected()) {
      DioHelper.postData(
          data: {
            'id': sessionId
          },
          url: EndPoints.sessions,
          token: CashHelper.prefs.getString('token') ?? ""
      ).then((value) {
          if(value.statusCode == 200){
            sessionDetailsModel = SessionDetailsModel.fromJson(value.data);
            if(sessionDetailsModel!.hasError!){
              emit(SessionDetailsError(message: sessionDetailsModel!.errors!.join(' ')));
            }
            else{
              emit(SessionDetailsSuccess());
            }
          }
          else{
            emit(SessionDetailsError(message: 'server error'));
          }
      }).catchError((error) {
        emit(SessionDetailsError(message: error.toString()));
      });
    }
    else{
      emit(NoInternetConnection());
    }
  }
}
