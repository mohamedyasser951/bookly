import 'package:dio/dio.dart';

class ApiService {
  static const String baseUrl = 'https://www.googleapis.com/books/v1/';
  final Dio dio;
  ApiService({required this.dio});

  Future<Map<String, dynamic>> get({required String endpoint}) async {
    Response reposnse = await dio.get(baseUrl + endpoint);
    return reposnse.data;
  }
}
