import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter_weather_29112021/base/resource_model.dart';
import 'package:flutter_weather_29112021/model/weather_model.dart';

import '../api/request/temp_request.dart';

class TempRepository{
  late TempRequest _tempRequest;

  TempRepository(TempRequest tempRequest){
    _tempRequest = tempRequest;
  }

  Future<ResourceModel<WeatherModel>> getTempCity(String cityName) async{
    Completer<ResourceModel<WeatherModel>> completer = Completer();
    completer.complete(ResourceModel.loading());

    try{
      Response response = await _tempRequest.tempCityRequest(cityName);
      print(response.toString());
    }catch(e){

    }
    return completer.future;
  }
}