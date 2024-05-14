part of 'sessions_cubit.dart';

@immutable
sealed class SessionsState {}

final class SessoinsIntial extends SessionsState {}


class ChangeTabIdx extends SessionsState{}

class GetAllSessionsLoading extends SessionsState{}
class GetAllSessionsSuccess extends SessionsState{}
class GetAllSessionsError extends SessionsState{
  final String message;
  GetAllSessionsError({required this.message});
}