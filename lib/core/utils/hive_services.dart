
import 'package:hive/hive.dart';
import '../../const/data.dart';
import '../../features/login/data/models/login_model.dart';
import '../../features/splash/data/models/location_model.dart';

class HiveServices{
  final _locationBox  = Hive.openBox<LocationModel>(LocationBox);
  Future<Iterable<LocationModel>> fetchHiveLocation() async {
    var box = await _locationBox;
    return box.values.toList();
}
  Future<Iterable<LocationModel>> addHiveLocation(LocationModel model) async {
    var box = await _locationBox;
    await box.add(model);
    return box.values;
  }
  Future<Iterable<LocationModel>> updateHiveLocation(LocationModel model) async {
    var box = await _locationBox;
    await box.compact();
    await box.putAt(0, model);
    return box.values;
  }

  final _loginDataBox  = Hive.openBox<LoginModel>(LoginBox);
  Future<Iterable<LoginModel>> fetchHiveLoginData() async {
    var box = await _loginDataBox;
    return box.values.toList();
  }
  Future<Iterable<LoginModel>> addHiveLoginData(LoginModel model) async {
    var box = await _loginDataBox;
    await box.add(model);
    return box.values;
  }
  Future<Iterable<LoginModel>> updateHiveLoginData(LoginModel model) async {
    var box = await _loginDataBox;
    await box.compact();
    await box.putAt(0, model);
    return box.values;
  }
  final _firstStateBox  = Hive.openBox<bool>('FirstState');
  Future<bool?> fetchFirstState({bool firstState = true}) async {
    var box = await _firstStateBox;
    return box.get('FirstState');
  }

  Future<bool?> setFirstState({bool firstState = true}) async {
    var box = await _firstStateBox;
    box.put("FirstState",firstState);
    return box.get('FirstState');
  }

}