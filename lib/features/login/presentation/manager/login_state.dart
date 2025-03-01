part of 'login_cubit.dart';

@immutable
sealed class LoginState {}

final class LoginInitial extends LoginState {}

final class LoginLoading extends LoginState {}

final class LoginSuccess extends LoginState {
  final LoginModel loginData;

  LoginSuccess({required this.loginData});
}

final class LoginWarning extends LoginState {
  final LoginModel loginData;
  LoginWarning({required this.loginData});
}

final class LoginFailure extends LoginState {
  final String error;

  LoginFailure({required this.error});
}

final class ChangeLoginObscureText extends LoginState {}

final class ChangeLoginAutoValidate extends LoginState {}

//-------------- Auto Login ---------------
final class AutoLoginSuccess extends LoginState {
  final LoginModel loginData;

  AutoLoginSuccess({required this.loginData});
}

final class AutoLoginLoading extends LoginState {}

final class AutoLoginFailure extends LoginState {
  final String error;

  AutoLoginFailure({required this.error});
}

//-------------- Register ---------------
final class RegisterLoading extends LoginState {}

final class RegisterSuccess extends LoginState {
  final RegisterModel model;
  RegisterSuccess({required this.model});
}
final class RegisterWarning extends LoginState {
  final RegisterModel model;
  RegisterWarning({required this.model});
}
final class RegisterFailure extends LoginState {
  final String error;

  RegisterFailure({required this.error});
}
final class ChangeRegisterObscureText extends LoginState {}
final class ChangeRegisterAutoValidate extends LoginState {}

//----------------- Fetch Hive Data ----------------------
final class FetchHiveLoginDataLoading extends LoginState {}
final class FetchHiveLoginDataSuccess extends LoginState {
  final LoginModel loginModel ;
  FetchHiveLoginDataSuccess({required this.loginModel});
}
final class FetchHiveLoginDataFailure extends LoginState {
  final String error;

  FetchHiveLoginDataFailure({required this.error});
}

//----------------- Add Hive Data ----------------------

final class AddHiveLoginDataLoading extends LoginState {}
final class AddHiveLoginDataSuccess extends LoginState {
  final LoginModel loginModel ;
  AddHiveLoginDataSuccess({required this.loginModel});
}
final class AddHiveLoginDataFailure extends LoginState {
  final String error;

  AddHiveLoginDataFailure({required this.error});
}

//----------------- Update Hive Data ----------------------

final class UpdateHiveLoginDataLoading extends LoginState {}
final class UpdateHiveLoginDataSuccess extends LoginState {
  final LoginModel loginModel ;
  UpdateHiveLoginDataSuccess({required this.loginModel});
}
final class UpdateHiveLoginDataFailure extends LoginState {
  final String error;

  UpdateHiveLoginDataFailure({required this.error});
}


