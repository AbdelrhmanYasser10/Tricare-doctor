import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:tricares_doctor_app/core/connection/internet_connection.dart';
import 'package:tricares_doctor_app/core/network/Remote/DioHelper.dart';
import 'package:tricares_doctor_app/core/network/endPoind.dart';
import 'package:tricares_doctor_app/features/home/models/tabs_model.dart';

import '../screens/widget/tab_content.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  List<Text> titles = [];
  List<TabContent> content = [];

  final _connectionService = ConnectionService();

  static HomeCubit get(context)=>BlocProvider.of(context);

  void getTabs()async{
    emit(TabsDataLoading());
    if(await _connectionService.isInternetConnected()){
      DioHelper.getData(url: EndPoints.about_request).then((value) {
        if(value.statusCode == 200){
          print(value.data);
          if(value.data["hasError"]){
            emit(TabsLoadedWithError(message: value.data['message'].join(' ')));

          }
          else{
            value.data['data']['partner_home_tabs'].forEach((element){
              TabsModel tab = TabsModel.fromJson(element);
              titles.add(
                Text(
                  tab.staticTitle!,
                ),
              );
              content.add(
                TabContent(htmlContent: tab.staticDescription!),
              );
            });
            emit(TabsLoaded());
          }
        }
        else{
          emit(TabsLoadedWithError(message: 'Server Error, try later'));
        }
      }).catchError((error){
        emit(TabsLoadedWithError(message: error.toString()));
      });
    }
    else{
      emit(NoInternetConnection());
    }
  }
}
