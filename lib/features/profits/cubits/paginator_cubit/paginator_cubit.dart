import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:number_paginator/number_paginator.dart';
import 'package:tricares_doctor_app/core/network/Local/CashHelper.dart';

import '../../../../core/connection/internet_connection.dart';
import '../../../../core/network/Remote/DioHelper.dart';
import '../../../../core/network/endPoind.dart';

part 'paginator_state.dart';

class PaginatorCubit extends Cubit<PaginatorState> {
  PaginatorCubit() : super(PaginatorInitial());
  final ConnectionService _connectionService = ConnectionService();

  static PaginatorCubit get(context) => BlocProvider.of(context);

  void getMaximumPage() async {
    emit(GetMaximumPageLoading());
    if (await _connectionService.isInternetConnected()) {
      DioHelper.postData(
        data: {
          'page': 1,
        },
        url: EndPoints.profitsTable,
        token: CashHelper.prefs.getString('token') ?? '',
      ).then((value) {
        if (value.statusCode == 200) {
          if (!value.data['hasError']) {
            emit(GetMaximumPageSuccess(max: value.data['data']['pageMax']));
          } else {
            emit(GetMaximumPageError(message: value.data['errors'].join(' ')));
          }
        } else {
          emit(GetMaximumPageError(message: 'Server Error'));
        }
      }).catchError((error) {
        emit(GetMaximumPageError(message: error.toString()));
      });
    } else {
      emit(NoInternetConnection());
    }
  }
}
