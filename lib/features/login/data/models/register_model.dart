
import 'package:egytour/features/login/data/models/register_data.dart';

class RegisterModel {
  final bool status;
  final String? message;
  final RegisterData? data;

  RegisterModel({required this.status, this.message, this.data});

  factory RegisterModel.fromJson(Map<String, dynamic> json) {
    return RegisterModel(
      status: json['status'] as bool,
      message: json['message'] as String?,
      data: json['data'] != null ? RegisterData.fromJson(json['data']) : null,
    );
  }
}