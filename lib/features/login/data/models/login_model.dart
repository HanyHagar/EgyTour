import 'package:hive/hive.dart';
import 'data_model.dart';

part 'login_model.g.dart'; // This will be generated

@HiveType(typeId: 3) // Unique type ID for Hive
class LoginModel extends HiveObject {
    @HiveField(0)
    late DataModel data;

    @HiveField(1)
    late String message;

    @HiveField(2)
    late bool status;

    LoginModel({
        required this.data,
        required this.message,
        required this.status,
    });

    factory LoginModel.fromJson(Map<dynamic, dynamic> json,String password) => LoginModel(
        data: DataModel.fromJson(json["data"],password),
        message: json["message"],
        status: json["status"],
    );

    Map<dynamic, dynamic> toJson() => {
        "data": data.toJson(),
        "message": message,
        "status": status,
    };
}
