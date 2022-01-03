import 'package:dio/dio.dart';
import 'package:flutter_weather_29112021/dio_client.dart';
import 'package:flutter_weather_29112021/temp_request.dart';

class TempRepository{
  late TempRequest _tempRequest;

  TempRepository(TempRequest tempRequest){
    _tempRequest = tempRequest;
  }

  Future getTempCity(){
    return _tempRequest.tempCityRequest();
  }
}