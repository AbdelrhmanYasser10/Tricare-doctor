part of 'profits_cubit.dart';

@immutable
sealed class ProfitsState {}

final class ProfitsInitial extends ProfitsState {}


class UpdatePageNumber extends ProfitsState{}
class GetProfitsTableLoading extends ProfitsState{}
class GetProfitsTableSuccessfully extends ProfitsState{}
class GetProfitsTableError extends ProfitsState{
  final String message;
  GetProfitsTableError({required this.message});
}

class NoInternet extends ProfitsState{}
