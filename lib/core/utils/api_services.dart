
import 'package:dio/dio.dart';

class ApiServices {

  static Dio? _dio;

  static init(){
    _dio = Dio(
      BaseOptions(
        baseUrl: "https://student.valuxapps.com/api/",
        receiveDataWhenStatusError: true,
      )
    );
  }


  Future<Response?> get({
    required String url,
    dynamic queryParameters,
    Map<String, dynamic>? data,
    String lang = 'en',
    String? token,
  }) async {
    _dio?.options.headers= {
      'Content-Type':'application/json',
      "lang": lang,
      "Authorization":token
    };
    return await _dio?.get(
      url,
      queryParameters: queryParameters,
      data: data
    );
  }

  Future<Response?> post({
    required String url,
    required Map<String, dynamic>? data,
    String lang = 'en',
    String? token,

  }) async {
    _dio?.options.headers= {
      'Content-Type':'application/json',
        "lang": lang,
        "Authorization":token
      };
    return await _dio?.post(
        url,
        data: data
    );
  }
}