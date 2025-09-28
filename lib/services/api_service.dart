import "package:dio/dio.dart";
import "package:logger/logger.dart";
import "../models/post.dart";

class ApiService {
  final Dio _dio= Dio();
  final Logger _logger = Logger();

  static const String baseUrl = "https://jsonplaceholder.typicode.com";

  ApiService() {
    _configureDio();
  }

  void _configureDio() {
    _dio.options = BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: Duration(seconds: 30),
      receiveTimeout: Duration(seconds: 30),
      contentType: 'application/json',
    );

    _dio.interceptors.add(LogInterceptor(
      requestBody: true,
      responseBody: true,
      requestHeader: true,
      responseHeader: true,
    ));
  }

  Future<Map<String, dynamic>> sendPost(Post post) async {
    try {
      final postData = {
        'title': post.title,
        'body': post.body,
        'userId': post.userId,
      };

      _logger.i("Sending POST request to $baseUrl/posts with data: $postData");

      final response = await _dio.post(
        '/posts',
        data: postData
      );

      _logger.i("Post request successful: ${response.data}");

      return response.data as Map<String, dynamic>;
    } catch (e) {
      _logger.e("Error preparing POST request: $e");
      rethrow;
    }
  }
}