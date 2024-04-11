import 'package:dio/dio.dart';

class DioService {
  final Dio _dio = Dio();

  Future<Map<String, dynamic>> fetchData(String path) async {
    try {
      Response response = await _dio.get(path);
      return response.data as Map<String, dynamic>;
    } catch (error, stacktrace) {
      print("Exception occurred: $error stackTrace: $stacktrace");
      return {};
    }
  }
}
