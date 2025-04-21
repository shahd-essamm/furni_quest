import 'package:dio/dio.dart';
import 'package:furni_quest/core/services/api_ocnstants.dart';

class ApiServices {
  final Dio dio;

  ApiServices(this.dio);

  Future<Response> postData({
    required String endpoint,
    required Map<String, dynamic> data,
  }) async {
    final url = "${ApiConstants.apiBaseUrl}$endpoint";
    return await dio.post(url, data: data);
  }

  Future<Response> getCategoryById({
    required String id,
  }) async {
    final url = "${ApiConstants.apiBaseUrl}${ApiConstants.categories}$id";
    return await dio.get(url);
  }

  Future<Response> getData({
    required String endpoint,
  }) async {
    final url = "${ApiConstants.apiBaseUrl}$endpoint";
    return await dio.get(
      url,
    );
  }
}
