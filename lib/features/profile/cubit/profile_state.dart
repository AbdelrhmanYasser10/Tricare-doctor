part of 'profile_cubit.dart';

@immutable
sealed class ProfileState {}

final class ProfileInitial extends ProfileState {}

class LogOutState extends ProfileState{}


class ChangeProfileLoading extends ProfileState{}
class ChangeProfileSuccess extends ProfileState{
  final bool hasError;
  final List messages;
  final List errors;

  ChangeProfileSuccess({required this.hasError,required this.messages,required this.errors,});
}
class ChangeProfileError extends ProfileState{}


class DeleteAccountLoading extends ProfileState{}
class DeleteAccountSuccess extends ProfileState{

  final bool hasError;
  final List messages;
  final List errors;

  DeleteAccountSuccess({required this.hasError,required this.messages,required this.errors,});

}
class DeleteAccountError extends ProfileState{}


class GetUserDataLoading extends ProfileState{}
class GetUserDataSuccess extends ProfileState{
  final bool hasError;
  final List messages;
  final List errors;
  final String? token;
  GetUserDataSuccess({required this.hasError,required this.messages,required this.errors, required this.token});
}
class GetUserDataError extends ProfileState{}


class ImagePickerSuccess extends ProfileState{}

class NoInternetConnection extends ProfileState{}




