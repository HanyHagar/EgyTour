import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:hive/hive.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/utils/hive_services.dart';
import '../../../../core/utils/location_service.dart';
import '../models/location_model.dart';
import 'splash_repo.dart';

 class SplashRepoImpl implements SplashRepo {
  @override
  Future<Either<Failure, LocationModel>> fetchLocation() async {
    try {
      LocationModel data = await LocationService().getCurrentLocation();
      // Map the Position to LocationModel
      return right(data);
    } catch (error) {
      if (error is DioException) {
        return left(
          ServerFailure.fromDioError(error),
        );
      }
      return left(
        ServerFailure(
          error.toString(),
        ),
      );
    }
  }
  @override
  Future<Either<Failure, Iterable<LocationModel>>> fetchHiveLocation() async {
    try {
      Iterable<LocationModel> data = await HiveServices().fetchHiveLocation();
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
  Future<Either<Failure, Iterable<LocationModel>>> addHiveLocation(LocationModel model) async {
    try {
      Iterable<LocationModel> data = await HiveServices().addHiveLocation(model);
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
  Future<Either<Failure, Iterable<LocationModel>>> updateHiveLocation(LocationModel model) async {
    try {
      Iterable<LocationModel> data = await HiveServices().updateHiveLocation(model);
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
