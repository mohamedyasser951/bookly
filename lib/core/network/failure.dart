import 'package:dio/dio.dart';

abstract class Failure {
  final String message;

  Failure({required this.message});
}

class ServerFailure extends Failure {
  ServerFailure({required super.message});

  factory ServerFailure.fromDioError(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure(message: 'Connection timeout with the server');
      case DioExceptionType.sendTimeout:
        return ServerFailure(message: 'Send timeout with the server');
      case DioExceptionType.receiveTimeout:
        return ServerFailure(message: 'Receive timeout with the server');
      case DioExceptionType.badCertificate:
        return ServerFailure(message: 'Bad certificate with the server');
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(response: dioException.response!);
      case DioExceptionType.cancel:
        return ServerFailure(message: 'Cancel with the server');
      case DioExceptionType.connectionError:
        return ServerFailure(message: 'Connection error with the server');
      case DioExceptionType.unknown:
        return ServerFailure(message: 'Unknown, please try again later');
    }
  }

  factory ServerFailure.fromResponse({required Response response}) {
    if (response.statusCode == 404) {
      return ServerFailure(message: "Not found, please try again later");
    } else if (response.statusCode == 500) {
      return ServerFailure(
          message: "Internal server error, please try again later");
    } else if (response.statusCode == 400 ||
        response.statusCode == 401 ||
        response.statusCode == 403) {
      return ServerFailure(message: "Bad request, please try again later");
    } else {
      return ServerFailure(message: 'Error occurred, please try again later');
    }
  }
}

class CacheFailure extends Failure {
  CacheFailure({required super.message});
}
