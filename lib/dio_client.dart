import 'package:dio/dio.dart';

class DioClient{

  static DioClient _dioClient = DioClient._internal() ;
  late Dio dio;

  DioClient._internal(){
    dio = Dio(BaseOptions(
      receiveTimeout: 30000,
      connectTimeout: 30000,
      baseUrl: "http://api.openweathermap.org"
    ));
    dio.interceptors.add(LogInterceptor(request: true));
  }

  static DioClient get instance => _dioClient;


}