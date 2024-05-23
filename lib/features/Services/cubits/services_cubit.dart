import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../core/connection/internet_connection.dart';
import '../../../core/network/Remote/DioHelper.dart';
import '../../../core/network/endPoind.dart';
import '../models/services_details_model.dart';

part 'services_state.dart';

class ServicesCubit extends Cubit<ServicesState> {
  ServicesCubit() : super(ServicesInitial());
  static ServicesCubit get(context)=>BlocProvider.of(context);

  ServiceDetailsModel? serviceDetailsModel;

  final ConnectionService _connectionService = ConnectionService();

  void getServiceDetails({required int serviceId})async{
    emit(ServicesDetailsLoading());
    if(await _connectionService.isInternetConnected()) {
      DioHelper.postData(
          data: {
            'id': serviceId
          },
          url: EndPoints.service,
      ).then((value) {
        if(value.statusCode == 200){
          serviceDetailsModel = ServiceDetailsModel.fromJson(value.data);
          if(serviceDetailsModel!.hasError!){
            emit(ServicesDetailsError(message: serviceDetailsModel!.errors!.join(' ')));
          }
          else{
            emit(ServicesDetailsSuccess());
          }
        }
        else{
          emit(ServicesDetailsError(message: 'server error'));
        }
      }).catchError((error) {
        emit(ServicesDetailsError(message: error.toString()));
      });
    }
    else{
      emit(NoInternetConnection());
    }
  }

}
