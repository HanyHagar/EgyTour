// ignore_for_file: depend_on_referenced_packages

import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../const/api_end_points.dart';
import '../../../../core/utils/hive_services.dart';
import '../../data/models/login_model.dart';
import '../../data/models/register_model.dart';
import '../../data/repo/login_repo.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.loginRepo) : super(LoginInitial());

  static LoginCubit get(context) => BlocProvider.of<LoginCubit>(context);

  final LoginRepo loginRepo;

  //-------------------SignIn----------------------
  GlobalKey<FormState> signInFormKey = GlobalKey<FormState>();
  var loginEmail = TextEditingController();
  var loginPassword = TextEditingController();
  bool signInTextObscure = false;
  static List<LoginModel> loginData = [];
  static bool firstLogin = true;
  AutovalidateMode autoValidate = AutovalidateMode.disabled;
  void changeSignInTextObscure() {
    signInTextObscure = !signInTextObscure;
    emit(ChangeLoginObscureText());
  }

  Future<void> signIn({required String email, required String password}) async {
    emit(LoginLoading());
    var loginData = await loginRepo.signIn(
      email: loginEmail.text,
      password: loginPassword.text,
    );
    loginData.fold((l) => emit(LoginFailure(error: l.errMessage)), (r) {
      if (r.status) {
        token = r.data.token;
        loginEmail.clear();
        loginPassword.clear();
        emit(LoginSuccess(loginData: r));
        if (firstLogin) {
          addHiveLoginData(r);
        } else {
          updateHiveLoginData(r);
        }
      } else {
        emit(LoginWarning(loginData: r));
      }
    });
  }

  void signInOnPressed() {
    if (signInFormKey.currentState!.validate()) {
      signIn(email: loginEmail.text, password: loginPassword.text);
    } else {
      autoValidate = AutovalidateMode.always;
      emit(ChangeLoginAutoValidate());
    }
  }

  Future<void> autoSignIn() async {
    emit(AutoLoginLoading());
    HiveServices()
        .fetchHiveLoginData()
        .then((onValue) async {
          if (onValue.isEmpty) {
            emit(AutoLoginFailure(error: "error"));
          } else {
            var loginData = await loginRepo.signIn(
              email: onValue.first.data.email,
              password: onValue.first.data.password,
            );
            loginData.fold((l) => emit(AutoLoginFailure(error: l.errMessage)),
             (r) {
              if (r.status) {
                emit(AutoLoginSuccess(loginData: r));
              } else {
                emit(AutoLoginFailure(error: r.message));
              }
            });
          }
        })
        .catchError((onError) {
          emit(AutoLoginFailure(error: onError.toString()));
        });
  }

  Future<void> fetchHiveLoginData() async {
    emit(FetchHiveLoginDataLoading());
    var result = await loginRepo.fetchHiveLoginData();
    result.fold(
      (l) {
        emit(FetchHiveLoginDataFailure(error: l.errMessage));
      },
      (r) {
        emit(FetchHiveLoginDataSuccess(loginModel: r.first));
      },
    );
  }

  Future<void> addHiveLoginData(LoginModel model) async {
    emit(AddHiveLoginDataLoading());
    var result = await loginRepo.addHiveLoginData(model);
    result.fold(
      (l) {
        emit(AddHiveLoginDataFailure(error: l.errMessage.toString()));
      },
      (r) {
        emit(AddHiveLoginDataSuccess(loginModel: r.first));
        loginData.clear();
        loginData.add(model);
        fetchHiveLoginData();
      },
    );
  }

  updateHiveLoginData(LoginModel model) async {
    emit(UpdateHiveLoginDataLoading());
    var result = await loginRepo.updateHiveLoginData(model);
    result.fold(
      (l) {
        emit(UpdateHiveLoginDataFailure(error: l.errMessage.toString()));
      },
      (r) {
        emit(UpdateHiveLoginDataSuccess(loginModel: r.first));
        loginData.clear();
        loginData.add(model);
        fetchHiveLoginData();
      },
    );
  }

  //-------------------Register----------------------
  GlobalKey<FormState> registerFormKey = GlobalKey<FormState>();
  var registerUserName = TextEditingController();
  var registerEmail = TextEditingController();
  var registerPhone = TextEditingController();
  var registerPassword = TextEditingController();
  String registerImage =
      "https://student.valuxapps.com/storage/uploads/users/zChXbMw35d_1739651807.jpeg";
  bool registerTextObscure = false;
  AutovalidateMode registerAutoValidate = AutovalidateMode.disabled;
  void changeRegisterTextObscure() {
    registerTextObscure = !registerTextObscure;
    emit(ChangeRegisterObscureText());
  }

  Future<void> register({
    required String userName,
    required String email,
    required String password,
    required String phone,
  }) async {
    var loginData = await loginRepo.register(
      email: email,
      password: password,
      userName: userName,
      phone: phone,
      image: registerImage,
    );
    loginData.fold(
      (l) {
        log("Register Failure : ${l.errMessage.toString()}");
        emit(RegisterFailure(error: l.errMessage));
      },
      (r) {
        if (r.status) {
          registerUserName.clear();
          registerPhone.clear();
          registerEmail.clear();
          registerPassword.clear();
          emit(RegisterSuccess(model: r));
        } else {
          emit(RegisterWarning(model: r));
        }
      },
    );
  }

  void registerOnPressed() {
    if (registerFormKey.currentState!.validate()) {
      register(
        email: registerEmail.text,
        password: registerPassword.text,
        userName: registerUserName.text,
        phone: registerPhone.text,
      );
    } else {
      autoValidate = AutovalidateMode.always;
      emit(ChangeRegisterAutoValidate());
    }
  }

  //-------------------Forget Password----------------------
  GlobalKey<FormState> forgetPasswordFormKey = GlobalKey<FormState>();
  var forgetPasswordEmail = TextEditingController();
  AutovalidateMode forgetPasswordAutoValidate = AutovalidateMode.disabled;
}
