part of 'paginator_cubit.dart';

@immutable
sealed class PaginatorState {}

final class PaginatorInitial extends PaginatorState {}


class GetMaximumPageLoading extends PaginatorState{}
class GetMaximumPageSuccess extends PaginatorState{
  final int max;
  GetMaximumPageSuccess({required this.max});
}
class GetMaximumPageError extends PaginatorState{
  final String message;
  GetMaximumPageError({required this.message});
}
class NoInternetConnection extends PaginatorState{

}