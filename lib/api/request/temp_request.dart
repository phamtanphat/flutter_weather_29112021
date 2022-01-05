import 'package:dio/dio.dart';
import 'package:flutter_weather_29112021/api/dio_client.dart';

class TempRequest {
  late Dio _dio;

  TempRequest() {
    _dio = DioClient.instance.dio;
  }

  //data/2.5/weather?appid=86183a23377ed034aef7aad102f43d64&units=metric&q=Hanoi
  Future tempCityRequest(String cityName) {
    return _dio.get("/data/2.5/weather", queryParameters: {
      "appid": "86183a23377ed034aef7aad102f43d64",
      "units": "metric",
      "q": cityName
    });
  }
}
