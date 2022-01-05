import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
part 'resource_model.freezed.dart';

@freezed
abstract class ResourceModel<T> with _$ResourceModel<T>{


  const factory ResourceModel.success(T value) = Success<T>;
  const factory ResourceModel.loading() = Loading<T>;
  const factory ResourceModel.error([String? message]) = Error<T>;
  // factory ResourceModel.error(String message) = Error<T>;
  // factory ResourceModel.loading() = Loading<T>;
}

// class Success<T> with ResourceModel<T>{
//   late T data;
//
//   Success(T data) : super(){
//     this.data = data;
//   }
// }
//
// class Loading<T> extends ResourceModel<T>{
//   Loading() : super();
// }
// class Error<T> extends ResourceModel<T>{
//   late T? data;
//   late String message;
//
//   Error(String message) : super(){
//     this.message = message;
//   }
// }


