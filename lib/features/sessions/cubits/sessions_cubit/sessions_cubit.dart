import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:tricares_doctor_app/core/network/Remote/DioHelper.dart';
import 'package:tricares_doctor_app/features/sessions/models/sessions_model.dart';

part 'sessions_state.dart';

class SessionsCubit extends Cubit<SessionsState> {
  SessionsCubit() : super(SessoinsIntial());

  static SessionsCubit get(context)=>BlocProvider.of(context);

  SessionsModel? sessionsModel;

  int tabIdx = 0;
  PageController pageController = PageController();
  void changeTabIdx({required int idx}){
    tabIdx = idx;
    if(idx == 1){
      pageController.nextPage(duration: const Duration(milliseconds: 300), curve: Curves.ease);
    }
    else{
      pageController.previousPage(duration: const Duration(milliseconds: 300), curve: Curves.ease);

    }
    emit(ChangeTabIdx());
  }




}
