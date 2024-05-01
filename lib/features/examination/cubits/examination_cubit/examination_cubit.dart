import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'examination_state.dart';

class ExaminationCubit extends Cubit<ExaminationState> {
  ExaminationCubit() : super(ExaminationInitial());

  static ExaminationCubit get(context)=>BlocProvider.of(context);

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
