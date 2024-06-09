import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
    print("I am from cubit");
    print(idx);
    pageController.animateToPage(idx, duration: const Duration(milliseconds: 300),curve: Curves.linear);


    emit(ChangeTabIdx());
  }




}
