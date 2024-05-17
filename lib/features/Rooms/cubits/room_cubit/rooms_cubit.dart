import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'rooms_state.dart';

class RoomsCubit extends Cubit<RoomsState> {
  RoomsCubit() : super(RoomsInitial());
}
