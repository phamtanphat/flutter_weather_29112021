import '../api/request/temp_request.dart';

class TempRepository{
  late TempRequest _tempRequest;

  TempRepository(TempRequest tempRequest){
    _tempRequest = tempRequest;
  }

  Future getTempCity(){
    return _tempRequest.tempCityRequest();
  }
}