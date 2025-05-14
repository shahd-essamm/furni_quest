import 'dart:io';

import 'package:dio/dio.dart';
import 'package:furni_quest/core/services/api_constans.dart';

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

  Future<Response> postMultipartData({
    required File imageFile,
  }) async {
    final url =
        "${ApiConstants.apiBaseUrl}${ApiConstants.colorPaletteWithPhoto}";

    FormData formData = FormData.fromMap({
      "image": await MultipartFile.fromFile(
        imageFile.path,
        filename: "upload.jpg",
      ),
    });

    return await dio.post(url, data: formData);
  }

  Future<Response> getCategoryById({
    required String id,
  }) async {
    final url = "${ApiConstants.apiBaseUrl}${ApiConstants.shopByCategory}$id";
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
