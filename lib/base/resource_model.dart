
import 'package:freezed_annotation/freezed_annotation.dart';

part 'resourcemodel.freezed.dart';

@freezed
class ResourceModel<T> with _$ResourceModel<T>{

  ResourceModel();

  factory ResourceModel.success(T data) = Success<T>;
  factory ResourceModel.error(String message) = Error<T>;
  factory ResourceModel.loading() = Loading<T>;
}

class Success<T> extends ResourceModel<T>{
  late T data;

  Success(T data) : super(){
    this.data = data;
  }
}

class Loading<T> extends ResourceModel<T>{
  Loading() : super();
}
class Error<T> extends ResourceModel<T>{
  late T? data;
  late String message;

  Error(String message) : super(){
    this.message = message;
  }
}


