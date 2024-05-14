import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:tricares_doctor_app/core/connection/internet_connection.dart';
import 'package:tricares_doctor_app/core/network/Local/CashHelper.dart';
import 'package:tricares_doctor_app/core/network/Remote/DioHelper.dart';
import 'package:tricares_doctor_app/features/profits/models/profit_details_model.dart';

import '../../../../core/network/endPoind.dart';

part 'profits_details_state.dart';

class ProfitsDetailsCubit extends Cubit<ProfitsDetailsState> {
  ProfitsDetailsCubit() : super(ProfitsDetailsInitial());

  static ProfitsDetailsCubit get(context)=>BlocProvider.of(context);

  ProfitDetailsModel? profitDetails;
  ConnectionService _connectionService = ConnectionService();
  void getDetails({required int profitId , required int fromPayment})async{
    emit(GetDetailsLoading());
    if(await _connectionService.isInternetConnected()) {
      DioHelper.postData(
        data: {
          'id': profitId,
          'payment_success': fromPayment,
        },
        url: EndPoints.profitsTable,
        token: CashHelper.prefs.getString('token') ?? "",
      ).then((value) {
        if(value.statusCode == 200) {
          print(value.data);
          profitDetails = ProfitDetailsModel.fromJson(value.data);
          if(!profitDetails!.hasError!){
            print(profitDetails!.data!.payments!.length);
            emit(GetDetailsSuccess());
          }
          else{
            emit(GetDetailsError(message: profitDetails!.messages!.join(' ')));
          }
        }
        else{
          emit(GetDetailsError(message: 'server error'));
        }
      }).catchError((error) {
        emit(GetDetailsError(message: error.toString()));
      });
    }
    else{
      emit(NoInternetConnection());
    }
  }


}
