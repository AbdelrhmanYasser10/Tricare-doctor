part of 'appointement_cubit.dart';

@immutable
sealed class AppointementState {}

final class AppointementInitial extends AppointementState {}
final class AppointementLoading extends AppointementState {}
final class AppointementError extends AppointementState {
  final String message;
  AppointementError({required this.message});
}
final class AppointementSuccess extends AppointementState {}
final class NoInternetConnection extends AppointementState {}

