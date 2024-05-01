part of 'examination_cubit.dart';

@immutable
sealed class ExaminationState {}

final class ExaminationInitial extends ExaminationState {}


class ChangeTabIdx extends ExaminationState{}

