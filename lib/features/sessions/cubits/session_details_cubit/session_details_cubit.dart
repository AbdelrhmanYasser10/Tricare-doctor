import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:tricares_doctor_app/features/sessions/models/session_details_model.dart';

part 'session_details_state.dart';

class SessionDetailsCubit extends Cubit<SessionDetailsState> {
  SessionDetailsCubit() : super(SessionDetailsInitial());

  static SessionDetailsCubit get(context)=>BlocProvider.of(context);

  SessionDetailsModel? sessionDetailsModel;

  void getSessionDetails({required int sessionId}){

  }
}
