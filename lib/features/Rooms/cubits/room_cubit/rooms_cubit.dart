import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'rooms_state.dart';

class RoomsCubit extends Cubit<RoomsState> {
  RoomsCubit() : super(RoomsInitial());

  static RoomsCubit get(context)=>BlocProvider.of(context);

  void getAllPartnerRooms(){

  }

  void getPartnerRoomSchedule(){

  }
}
