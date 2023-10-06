import 'package:dio/dio.dart';
import 'package:tommy_kotonchik/app_text_constants.dart';

class DioSettings {
  DioSettings() {
    initialSettings();
  }

  Dio dio = Dio(
    BaseOptions(
      baseUrl: AppTextConstants.mainServer,
      responseType: ResponseType.json,
      contentType: "application/json; charset=utf-8",
      connectTimeout: const Duration(milliseconds: 2500),
      receiveTimeout: const Duration(milliseconds: 2500),
    ),
  );
  void initialSettings() {
    final interceptors = dio.interceptors;
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          options.headers['X-API-KEY'] = AppTextConstants.token;

          return handler.next(options);
        },
        onResponse: (response, handler) {
          return handler.next(response);
        },
        onError: (DioException e, handler) {
          return handler.next(e);
        },
      ),
    );
    interceptors.add(
      LogInterceptor(
        request: true,
        requestBody: true,
        requestHeader: true,
        responseBody: true,
        responseHeader: true,
      ),
    );
  }
}
