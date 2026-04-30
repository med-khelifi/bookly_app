import 'package:dio/dio.dart';

class ApiClient {
  final String _baseUrl = "https://www.googleapis.com/books/v1/";
  final Dio _dio;
  ApiClient({required Dio dio}) : _dio = dio;

  Future<Map<String, dynamic>> get({
    required String endPoint,
    Map<String, dynamic>? queryParameters,
  }) async {
    final response = await _dio.get(
      '$_baseUrl$endPoint',
      queryParameters: queryParameters,
    );
    return response.data;
  }
}
