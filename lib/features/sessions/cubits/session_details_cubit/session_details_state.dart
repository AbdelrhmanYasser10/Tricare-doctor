part of 'session_details_cubit.dart';

@immutable
sealed class SessionDetailsState {}

final class SessionDetailsInitial extends SessionDetailsState {}
final class SessionDetailsLoading extends SessionDetailsState {}
final class SessionDetailsSuccess extends SessionDetailsState {}
final class SessionDetailsError extends SessionDetailsState {
  final String message;
  SessionDetailsError({required this.message});
}
final class NoInternetConnection extends SessionDetailsState{}
