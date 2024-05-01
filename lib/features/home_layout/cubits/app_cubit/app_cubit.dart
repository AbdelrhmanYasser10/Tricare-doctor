import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppInitial());
  static AppCubit get(context) => BlocProvider.of(context);
  int currentIndexScreen = 0;
  PageController homeLayoutController = PageController();

  void changeSelectedIndexNav(int index) {
    currentIndexScreen = index;
    emit(ChangeCurrentIndexScreen());
  }

  void goToScreenAtIndex(int index) {
    homeLayoutController.animateToPage(
      index,
      duration: const Duration(milliseconds: 250),
      curve: Curves.linear,
    );
  }
}
