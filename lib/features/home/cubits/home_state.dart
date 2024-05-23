part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}
final class TabsDataLoading extends HomeState {}
final class TabsLoaded extends HomeState {}
final class TabsLoadedWithError extends HomeState {
  final String message;
  TabsLoadedWithError({required this.message});
}
final class NoInternetConnection extends HomeState {}
