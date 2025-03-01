import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/utils/hive_services.dart';
import '../../../data/models/location_model.dart';
import '../../../data/repo/splash_repo.dart';
part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit(this.splashRepo) : super(SplashInitial());
  final SplashRepo splashRepo;
  static SplashCubit get(context) => BlocProvider.of<SplashCubit>(context);
  LocationModel standard = LocationModel.stander();
  bool changeStandardLocation = false;
  Future<void> getLocation() async {
    emit(GetLocationLoading());
    var result = await splashRepo.fetchLocation();
    result.fold(
      (l) {
        emit(GetLocationFailure(error: l.errMessage.toString()));
        fetchHiveLocation();
      },
      (r) {
        if(r.city.city == 'Throttled! See geocode.xyz/pricing'){
          log("message R : ${r.city.city.toString()}");
          log("message S : ${standard.city.city.toString()}");
          standard = r;
          // ShopCubit.location = standard;
          log("message R : ${r.city.city.toString()}");
          log("message S : ${r.city.city.toString()}");
          changeStandardLocation = false;
        }
        else{
          log("message R : ${r.city.city.toString()}");
          log("message S : ${standard.city.city.toString()}");
          standard = r;
          // ShopCubit.location = standard;
          log("message R : ${r.city.city.toString()}");
          log("message S : ${r.city.city.toString()}");
          changeStandardLocation = true;
        }

        emit(GetLocationSuccess(locationModel: r));
        fetchHiveLocation();
      },
    );
  }
  Future<void> fetchHiveLocation() async {
    emit(GetHiveLocationLoading());
    var result = await splashRepo.fetchHiveLocation();
    result.fold(
      (l) {
        emit(GetHiveLocationFailure(error: l.errMessage.toString()));
        addHiveLocation(standard);
      },
      (r) async {
        if(r.isEmpty){
          emit(GetHiveLocationSuccess(locationModel: standard));
          addHiveLocation(standard);
        }
        else{
          if (changeStandardLocation) {
            // log("changeStandardLocation" : )
            // ShopCubit.location = standard;
            emit(GetHiveLocationSuccess(locationModel: standard));
            updateHiveLocation(standard);
          }
          else {
            // ShopCubit.location = r.first;
            emit(GetHiveLocationSuccess(locationModel: r.first));
            updateHiveLocation(r.first);
          }
        }

      },
    );
  }

  Future<void> addHiveLocation(LocationModel model) async {
    emit(AddHiveLocationLoading());
    var result = await splashRepo.addHiveLocation(model);
    result.fold(
      (l) {
        emit(AddHiveLocationFailure(error: l.errMessage.toString()));
      },
      (r) async {
        emit(AddHiveLocationSuccess(locationModel: model));
        await HiveServices().setFirstState(firstState: false);
      },
    );
  }
  Future<void> updateHiveLocation(LocationModel model) async {
    emit(UpdateHiveLocationLoading());
    var result = await splashRepo.updateHiveLocation(model);
    result.fold(
      (l) {
        emit(UpdateHiveLocationFailure(error: l.errMessage.toString()));
      },
      (r) {
        emit(UpdateHiveLocationSuccess(locationModel: model));
      },
    );
  }
}
