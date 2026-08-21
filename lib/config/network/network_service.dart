import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:offline_first/config/network/endpoint.dart';

@lazySingleton
class NetworkClient {
  final Dio _dio;

  NetworkClient(this._dio) {
    _dio.interceptors.add(
      LogInterceptor(
        request: true,
        requestBody: true,
        responseBody: false,
        responseHeader: true,
        error: true,
        logPrint: (message) {
          print(message);
        },
      ),
    );
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          // Check if it has the key in the extras and the key is set to true.
          return handler.next(options);
        },
      ),
    );
  }

  Future<Response> performRequest(Endpoint endpoint) async {
    final url = endpoint.path;

    try {
      final requestOptions = endpoint.toRequestOptions();

      switch (endpoint.method) {
        case RequestMethod.get:
          return await _dio.get(
            url.toString(),
            queryParameters: requestOptions.queryParameters,
            options: Options(extra: requestOptions.extra),
          );

        case RequestMethod.post:
          return await _dio.post(
            url,
            data: requestOptions.data,
            queryParameters: requestOptions.queryParameters,
            options: Options(extra: requestOptions.extra),
          );
        case RequestMethod.put:
          return await _dio.put(
            url,
            data: requestOptions.data,
            queryParameters: requestOptions.queryParameters,
            options: Options(extra: requestOptions.extra),
          );
        case RequestMethod.patch:
          return await _dio.patch(
            url,
            data: requestOptions.data,
            queryParameters: requestOptions.queryParameters,
            options: Options(extra: requestOptions.extra),
          );
        case RequestMethod.delete:
          return await _dio.delete(
            url,
            data: requestOptions.data,
            queryParameters: requestOptions.queryParameters,
            options: Options(extra: requestOptions.extra),
          );
      }
    } on DioException catch (_) {
      rethrow;
    }
  }
}
