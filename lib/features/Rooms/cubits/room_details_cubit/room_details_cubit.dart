import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:tricares_doctor_app/core/connection/internet_connection.dart';
import 'package:tricares_doctor_app/core/network/Local/CashHelper.dart';
import 'package:tricares_doctor_app/core/network/Remote/DioHelper.dart';
import 'package:tricares_doctor_app/features/Rooms/models/room_details_model.dart';

import '../../../../core/network/endPoind.dart';

part 'room_details_state.dart';

class RoomDetailsCubit extends Cubit<RoomDetailsState> {
  RoomDetailsCubit() : super(RoomDetailsInitial());


  static RoomDetailsCubit get(context)=>BlocProvider.of(context);

  RoomsDetailsModel? roomsDetailsModel;
  final ConnectionService _connectionService = ConnectionService();
  void getRoomDetails({required int roomId})async{
    if(await _connectionService.isInternetConnected()){
      emit(RoomDetailsLoading());
      DioHelper.postData(
          data: {
            'type':'room',
            'id':roomId,
          },
          url: EndPoints.rooms,
        token: CashHelper.prefs.getString('token')??""
      ).then((value) {
          if(value.statusCode == 200){
            roomsDetailsModel = RoomsDetailsModel.fromJson(value.data);
            if(!roomsDetailsModel!.hasError!){
              emit(RoomDetailsSuccess());
            }
            else{
              emit(RoomDetailsError(message: roomsDetailsModel!.errors!.join(' ')));

            }
          }
          else{
            emit(RoomDetailsError(message: 'server'));
          }
      }).catchError((error){
        emit(RoomDetailsError(message: error.toString()));
      });
    }
    else{
      emit(NoInternetConnection());
    }
  }

}
