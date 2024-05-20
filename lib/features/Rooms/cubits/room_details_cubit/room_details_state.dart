part of 'room_details_cubit.dart';

@immutable
sealed class RoomDetailsState {}

final class RoomDetailsInitial extends RoomDetailsState {}
final class RoomDetailsLoading extends RoomDetailsState {}
final class RoomDetailsSuccess extends RoomDetailsState {}
final class RoomDetailsError extends RoomDetailsState {
  final String message;
  RoomDetailsError({required this.message});
}
final class NoInternetConnection extends RoomDetailsState {}

