part of 'add_profit_cubit.dart';

@immutable
sealed class AddProfitState {}

final class AddProfitInitial extends AddProfitState {}
final class AddProfitLoading extends AddProfitState {}
final class AddProfitSuccess extends AddProfitState {
}
final class AddProfitError extends AddProfitState {
  final String message;
  AddProfitError({required this.message});
}
final class NoInternetConnection extends AddProfitState{}
