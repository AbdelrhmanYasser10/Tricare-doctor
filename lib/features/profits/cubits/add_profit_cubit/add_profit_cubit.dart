import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:tricares_doctor_app/core/network/Local/CashHelper.dart';
import 'package:tricares_doctor_app/core/network/Remote/DioHelper.dart';
import 'package:tricares_doctor_app/core/network/endPoind.dart';

part 'add_profit_state.dart';

class AddProfitCubit extends Cubit<AddProfitState> {
  AddProfitCubit() : super(AddProfitInitial());

  static AddProfitCubit get(context)=>BlocProvider.of(context);

  void addNewProfit({
 required String password,
 required String amount,
 required String notes,
 required String paymentOption,
  }){

    emit(AddProfitLoading());
    DioHelper.postData(
        data: {
          'accept_tos':'1',
          'partord_amount':amount,
          'partord_notes':notes,
          'payment_option':"1",
          'password':password,
        },
        url: EndPoints.add_new_profit,
      token: CashHelper.prefs.getString('token')??""
    ).then((value) {
      if(value.statusCode == 200){
        emit(AddProfitSuccess());
      }
      else{
        emit(AddProfitError(message: 'server error'));
      }
    }).catchError((error){
      emit(AddProfitError(message: error.toString()));
    });

  }
}
