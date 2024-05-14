import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:number_paginator/number_paginator.dart';
import 'package:tricares_doctor_app/core/connection/internet_connection.dart';
import 'package:tricares_doctor_app/core/network/endPoind.dart';

import '../../../../core/network/Local/CashHelper.dart';
import '../../../../core/network/Remote/DioHelper.dart';
import '../../models/profits_model.dart';

part 'profits_state.dart';

class ProfitsCubit extends Cubit<ProfitsState> {
  ProfitsCubit() : super(ProfitsInitial());

  static ProfitsCubit get(context)=>BlocProvider.of(context);
  ProfitsModel? profitsModel;
  final ConnectionService _connectionService = ConnectionService();


  void getProfitsTable({required String token , int pageNumber = 1})async {
    emit(GetProfitsTableLoading());
    if (await _connectionService.isInternetConnected()) {
      DioHelper.postData(
        data: {
          'page': pageNumber,
        },
        url: EndPoints.profitsTable,
        token: token,
      ).then((value) {
        if(value.statusCode == 200){
          profitsModel = ProfitsModel.fromJson(value.data);
          if(!profitsModel!.hasError!){
            emit(GetProfitsTableSuccessfully());
          }
          else{
            emit(GetProfitsTableError(message: profitsModel!.errors!.join(' ')));
          }
        }
        else{
          emit(GetProfitsTableError(message: 'Server Error'));

        }

      }).catchError((error) {
          emit(GetProfitsTableError(message: error.toString()));
      });
    }
    else{
      emit(NoInternet());
    }
  }

  }



