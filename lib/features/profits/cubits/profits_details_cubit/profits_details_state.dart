part of 'profits_details_cubit.dart';

@immutable
sealed class ProfitsDetailsState {}

final class ProfitsDetailsInitial extends ProfitsDetailsState {}

class GetDetailsLoading extends ProfitsDetailsState{}
class GetDetailsSuccess extends ProfitsDetailsState{}
class GetDetailsError extends ProfitsDetailsState{
  final String message;
  GetDetailsError({required this.message});
}
class NoInternetConnection extends ProfitsDetailsState{}
