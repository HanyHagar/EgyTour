import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../models/location_model.dart';


abstract class SplashRepo {
  Future<Either<Failure, LocationModel>> fetchLocation();
  Future<Either<Failure, Iterable<LocationModel>>> fetchHiveLocation();
  Future<Either<Failure, Iterable<LocationModel>>> addHiveLocation(LocationModel model);

  Future<Either<Failure, Iterable<LocationModel>>> updateHiveLocation(LocationModel model);





}
