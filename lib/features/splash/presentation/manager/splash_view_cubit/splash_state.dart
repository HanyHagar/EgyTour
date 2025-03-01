part of 'splash_cubit.dart';

@immutable
sealed class SplashState {}

final class SplashInitial extends SplashState {}

final class GetLocationLoading extends SplashState {}

final class GetLocationSuccess extends SplashState {
  final LocationModel locationModel ;
  GetLocationSuccess({required this.locationModel});
}

final class GetLocationFailure extends SplashState {
  final String error;

  GetLocationFailure({required this.error});
}

//----------------- Fetch Hive Data ----------------------
final class GetHiveLocationLoading extends SplashState {}

final class GetHiveLocationSuccess extends SplashState {
  final LocationModel locationModel ;
  GetHiveLocationSuccess({required this.locationModel});
}

final class GetHiveLocationFailure extends SplashState {
  final String error;

  GetHiveLocationFailure({required this.error});
}

//----------------- Add Hive Data ----------------------

final class AddHiveLocationLoading extends SplashState {}

final class AddHiveLocationSuccess extends SplashState {
  final LocationModel locationModel ;
  AddHiveLocationSuccess({required this.locationModel});
}

final class AddHiveLocationFailure extends SplashState {
  final String error;

  AddHiveLocationFailure({required this.error});
}

//----------------- Update Hive Data ----------------------

final class UpdateHiveLocationLoading extends SplashState {}

final class UpdateHiveLocationSuccess extends SplashState {
  final LocationModel locationModel ;
  UpdateHiveLocationSuccess({required this.locationModel});
}

final class UpdateHiveLocationFailure extends SplashState {
  final String error;

  UpdateHiveLocationFailure({required this.error});
}
