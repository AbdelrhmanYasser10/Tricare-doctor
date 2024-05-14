import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'session_details_state.dart';

class SessionDetailsCubit extends Cubit<SessionDetailsState> {
  SessionDetailsCubit() : super(SessionDetailsInitial());
}
