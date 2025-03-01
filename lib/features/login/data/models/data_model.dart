import 'package:hive/hive.dart';

part 'data_model.g.dart'; // This will be generated

@HiveType(typeId: 4) // Unique type ID for Hive
class DataModel extends HiveObject {
  @HiveField(0)
  String image;

  @HiveField(1)
  String phone;

  @HiveField(2)
  String name;

  @HiveField(3)
  int id;

  @HiveField(4)
  int credit;

  @HiveField(5)
  String email;

  @HiveField(6)
  int points;

  @HiveField(7)
  String token;

  @HiveField(8)
  String password;
  DataModel({
    required this.image,
    required this.phone,
    required this.name,
    required this.id,
    required this.credit,
    required this.email,
    required this.points,
    required this.token,
    required this.password
  });

  factory DataModel.fromJson(Map<dynamic, dynamic> json,String password) => DataModel(
    image: json["image"],
    phone: json["phone"],
    name: json["name"],
    id: json["id"],
    credit: json["credit"],
    email: json["email"],
    points: json["points"],
    token: json["token"],
    password: password
  );

  Map<dynamic, dynamic> toJson() => {
    "image": image,
    "phone": phone,
    "name": name,
    "id": id,
    "credit": credit,
    "email": email,
    "points": points,
    "token": token,
    'password':password
  };
}
