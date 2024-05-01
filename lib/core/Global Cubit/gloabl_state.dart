part of 'global_cubit.dart';

@immutable
sealed class GlobalState {}

final class AppInitial extends GlobalState {}


class ChangeTheme extends GlobalState{}
class ChangeLocal extends GlobalState{}
