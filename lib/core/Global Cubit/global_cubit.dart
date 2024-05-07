import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import '../network/Local/CashHelper.dart';

part 'gloabl_state.dart';

class GlobalCubit extends Cubit<GlobalState> {
  GlobalCubit() : super(AppInitial());

  bool isLight = true;
  int selectOption = CashHelper.getData(key: 'local') == null? 1: CashHelper.getData(key: 'local') == 'en'?1:2 ;
  String local = CashHelper.getData(key: 'local')??'en';


  PageController homeLayoutController = PageController();
  int currentIndexScreen = 0;
  void changeSelectedIndexNav(int index){
    currentIndexScreen = index;
    emit(ChangeCurrentIndexScreen());
  }

  void goToScreenAtIndex(int index){
    homeLayoutController.animateToPage(
      index,
      duration: const Duration(milliseconds: 250),
      curve: Curves.linear,
    );
  }


   void changeTheme(){
    isLight = !isLight;
    emit(ChangeTheme());
  }

  Future<void> changeLocal({required int value})async{

     if(value == 1){
         await CashHelper.prefs.setString('local', 'en');
         local = 'en';
         selectOption = 1;
     }
     else
       {
          await CashHelper.prefs.setString('local', 'ar');
          local = 'ar';
          selectOption = 2;

       }


    emit(ChangeTheme());
  }


}





