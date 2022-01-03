import 'package:dio/dio.dart';
import 'package:flutter_weather_29112021/dio_client.dart';

class TempRequest{
  late Dio _dio;

  TempRequest(){
    _dio = DioClient.instance.dio;
  }

  Future tempCityRequest(){
    return _dio.get("");
  }
}