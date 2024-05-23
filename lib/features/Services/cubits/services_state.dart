part of 'services_cubit.dart';

@immutable
sealed class ServicesState {}

final class ServicesInitial extends ServicesState {}
final class ServicesDetailsLoading extends ServicesState {}
final class ServicesDetailsSuccess extends ServicesState {}
final class ServicesDetailsError extends ServicesState {
final String message;
ServicesDetailsError({required this.message});
}
final class NoInternetConnection extends ServicesState{}
