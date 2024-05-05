part of 'auth_cubit.dart';

@immutable
sealed class AuthState {}

class NoInterNetConnection extends AuthState{}

class AuthInitial extends AuthState {}


class LoginLoading extends AuthState{}

class LoginSuccess extends AuthState{
  final bool hasError;
  final List messages;
  final List errors;
  final String? token;
  LoginSuccess({required this.hasError,required this.messages,required this.errors, required this.token});
}

class LoginError extends AuthState{}


class RegisterLoading extends AuthState{}

class RegisterSuccess extends AuthState{
  final bool hasError;
  final List messages;
  final List errors;
  RegisterSuccess({required this.hasError,required this.messages,required this.errors});

}
class RegisterError extends AuthState{}


class PickFilesLoading extends AuthState{}
class PickFilesSuccessfully extends AuthState{

}
class PickFilesError extends AuthState{}
class RemoveFile extends AuthState{}




class ForgetPasswordLoading extends AuthState{}
class ForgetPasswordSuccess extends AuthState{
  final bool hasError;
  final List messages;
  final List errors;
  final String? uniqueId;
  ForgetPasswordSuccess({required this.hasError,required this.messages,required this.errors, required this.uniqueId});
}
class ForgetPasswordError extends AuthState{}



class ResetPasswordLoading extends AuthState{}
class ResetPasswordSuccess extends AuthState{
  final bool hasError;
  final List messages;
  final List errors;
  final token;

  ResetPasswordSuccess({required this.hasError,required this.messages,required this.errors, required this.token});
}
class ResetPasswordError extends AuthState{}

class ResendRegisterLoading extends AuthState{}
class ResendRegisterSuccess extends AuthState{}
class ResendRegisterError extends AuthState{}

class AllCountriesLoading extends AuthState{}
class AllCountriesSuccess extends AuthState{}
class AllCountriesError extends AuthState{}


