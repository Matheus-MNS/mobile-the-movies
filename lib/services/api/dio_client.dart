import 'package:dio/dio.dart';

import '../../core/constants/api_constants.dart';
class DioClient {
  DioClient._();

  static Dio create() {

    if(ApiConstants.accessToken.isEmpty) {
      throw StateError('TMDB_ACCESS_TOKEN não configurado. '
      'Rode com: flutter run --dart-define=TMDB_ACCESS_TOKEN=seu_token',);
    }

    final dio = Dio(
      BaseOptions(
        baseUrl: ApiConstants.baseUrl,
        connectTimeout: const Duration(seconds: 15),
        receiveTimeout: const Duration(seconds: 15),
        headers: {
          'Content-Type': 'application/json',
        },
        queryParameters: {
          'language': 'pt-BR',
        },
      ),
    );

    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          options.headers['Authorization'] =
              'Bearer ${ApiConstants.accessToken}';
          return handler.next(options);
        },
      ),
    );

    dio.interceptors.add(
      LogInterceptor(
        request: true,
        requestHeader: true,
        requestBody: true,
        responseHeader: false,
        responseBody: true,
        error: true,
      ),
    );

    return dio;
  }
}