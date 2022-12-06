import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_restapi/constants/api_constants.dart';
import 'package:riverpod_restapi/core/dio_exception.dart';

final apiServiceProvider = Provider<ApiService>((ref) {
  return ApiService();
});

class ApiService {
  getData({required String endpoint}) async {
    final Dio dio = Dio(
      BaseOptions(
          baseUrl: ApiConstants.baseUrl,
          headers: {"accept": "application/json"}),
    );
    try {
      final result = await dio.get(endpoint);
      return result.data;
    } on DioError catch (e) {
      throw DioException.fromDioError(e);
    }
  }
}
