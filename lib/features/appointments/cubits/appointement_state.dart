part of 'appointement_cubit.dart';

@immutable
sealed class AppointementState {}

final class AppointementInitial extends AppointementState {}
final class AppointementLoading extends AppointementState {}
final class AppointementError extends AppointementState {
  final List<String> message;
  AppointementError({required this.message});
}
final class AppointementSuccess extends AppointementState {}
final class AddNewTimeOrDay extends AppointementState {}
final class RemoveTimeOrDay extends AppointementState {}
