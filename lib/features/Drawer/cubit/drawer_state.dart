part of 'drawer_cubit.dart';

@immutable
sealed class DrawerState {}

final class DrawerInitial extends DrawerState {}


class GetSettingDataLoading extends DrawerState{}
class GetSettingDataSuccess extends DrawerState{}
class GetSettingDataError extends DrawerState{}

class GetTosLoading extends DrawerState{}
class GetTosSuccess extends DrawerState{}
class GetTosError extends DrawerState{}

class GetAboutUsLoading extends DrawerState{}
class GetAboutUsSuccess extends DrawerState{}
class GetAboutUsError extends DrawerState{}


class NoInternetConnection extends DrawerState{}
