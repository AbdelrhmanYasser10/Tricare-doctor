part of 'appointment_details_cubit.dart';

@immutable
sealed class AppointmentDetailsState {}

final class AppointmentDetailsInitial extends AppointmentDetailsState {}
final class NoInternetConnection extends AppointmentDetailsState {}
final class AppointmentDetailsLoading extends AppointmentDetailsState {}
final class AppointmentDetailsSuccess extends AppointmentDetailsState {}
final class AppointmentDetailsError extends AppointmentDetailsState {
  final String message;
  AppointmentDetailsError({required this.message});
}
final class TimeSlotUpdateLoading extends AppointmentDetailsState {}
final class TimeSlotUpdateSuccessfully extends AppointmentDetailsState {
final bool hasError;
final List messages;
final List errors;

TimeSlotUpdateSuccessfully({required this.hasError,required this.messages,required this.errors,});
}
final class TimeSlotUpdateError extends AppointmentDetailsState {
  final String message;
  TimeSlotUpdateError({required this.message});
}
