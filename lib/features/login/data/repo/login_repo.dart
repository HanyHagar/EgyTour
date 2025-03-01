import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../models/login_model.dart';
import '../models/register_model.dart';

abstract class LoginRepo {
  Future<Either<Failure,LoginModel>> signIn({required String email , required String password});
  Future<Either<Failure,RegisterModel>> register({required String userName , required String phone,required String email , required String password,required String image});
  Future<Either<Failure, Iterable<LoginModel>>> fetchHiveLoginData();
  Future<Either<Failure, Iterable<LoginModel>>> addHiveLoginData(LoginModel model);
  Future<Either<Failure, Iterable<LoginModel>>> updateHiveLoginData(LoginModel model);
}