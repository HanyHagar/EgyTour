import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:egytour/const/api_end_points.dart';
import 'package:hive/hive.dart';
import '../../../../const/data.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/utils/api_services.dart';
import '../../../../core/utils/hive_services.dart';
import '../models/login_model.dart';
import '../models/register_model.dart';
import 'login_repo.dart';

class LoginRepoImpl extends LoginRepo {
  @override
  Future<Either<Failure, LoginModel>> signIn({
    required String email,
    required String password,
  }) async {
    try {
      final response = await ApiServices().post(
        url: loginEndPoint,
        data: {"email": email, "password": password},
      );
      log(response!.data.toString());
      LoginModel loginModel = LoginModel.fromJson(response.data,password);
      return Right(loginModel);
    } catch (onError) {
      if (onError is DioException) {
        return Left(ServerFailure.fromDioError(onError));
      }
      return Left(ServerFailure(onError.toString()));
    }
  }

  @override
  Future<Either<Failure, RegisterModel>> register({
    required String userName,
    required String phone,
    required String email,
    required String password,
    required String image
  }) async {
    try {
      final response = await ApiServices().post(
        url: registerEndPoint,
        lang: 'ar',
        data: {'name':userName,"phone":phone,"email": email, "password": password,'image':image},
      );
      RegisterModel model = RegisterModel.fromJson(response?.data);
      return Right(model);
    } catch (onError) {
      if (onError is DioException) {
        return Left(ServerFailure.fromDioError(onError));
      }
      return Left(ServerFailure(onError.toString()));
    }
  }

  @override
  Future<Either<Failure, Iterable<LoginModel>>> fetchHiveLoginData() async {
    try {
      Iterable<LoginModel> data = await HiveServices().fetchHiveLoginData();
      // Map the Position to LocationModel

      return right(data);
    } catch (e) {
      if (e is HiveError) {
        return left(
          HiveFailure.fromHiveError(e),
        );
      }
      return left(
        HiveFailure(
          e.toString(),
        ),
      );
    }
  }
  @override
  Future<Either<Failure, Iterable<LoginModel>>> addHiveLoginData(LoginModel model) async {
    try {
      Iterable<LoginModel> data = await HiveServices().addHiveLoginData(model);

      return right(data);
    } catch (e) {
      if (e is HiveError) {
        return left(
          HiveFailure.fromHiveError(e),
        );
      }
      return left(
        HiveFailure(
          e.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<Failure, Iterable<LoginModel>>> updateHiveLoginData(LoginModel model) async {
    try {
      Iterable<LoginModel> data = await HiveServices().updateHiveLoginData(model);
      return right(data);
    } catch (e) {
      if (e is HiveError) {
        return left(
          HiveFailure.fromHiveError(e),
        );
      }
      return left(
        HiveFailure(
          e.toString(),
        ),
      );
    }
  }
}
