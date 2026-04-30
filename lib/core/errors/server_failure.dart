import 'dart:math';

import 'package:bookly/core/errors/failure.dart';
import 'package:dio/dio.dart';

class ServerFailure extends Failure {
  ServerFailure(String message) : super(message: message);

  factory ServerFailure.fromEx(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure('Connection timeout with API server');
      case DioExceptionType.sendTimeout:
        return ServerFailure('Send timeout with API server');
      case DioExceptionType.receiveTimeout:
        return ServerFailure('Receive timeout with API server');
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
          e.response!.statusCode!,
          e.response!.data,
        );
      case DioExceptionType.cancel:
        return ServerFailure('Request to API server was cancelled');
      case DioExceptionType.unknown:
        return ServerFailure('Unexpected error, please try again!');
      case DioExceptionType.badCertificate:
        return ServerFailure('Bad certificate, please try again!');
      case DioExceptionType.connectionError:
        return ServerFailure('Connection error with API server');
      }
  }

  factory ServerFailure.fromResponse(int statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403 || statusCode == 429) {
      return ServerFailure(response['error']['message']);
    } else if (statusCode == 404) {
      return ServerFailure('Your request not found, please try later!');
    } else if (statusCode == 500) {
      return ServerFailure('Internal server error, please try later!');
    } 
    // else if (statusCode == 429) {
    //   return ServerFailure('Too many requests, please try again later!');
    // }
    else {
      return ServerFailure('Oops, something went wrong, please try again!');
    }
  }
}
