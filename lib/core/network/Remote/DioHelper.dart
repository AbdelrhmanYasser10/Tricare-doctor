import 'package:dio/dio.dart';
import '../Local/CashHelper.dart';

class DioHelper {
  static late Dio dio;

  DioHelper._internal();

  static DioHelper? _instance;

  factory DioHelper() {
    _instance ??= DioHelper._internal();
    return _instance!;
  }

  static void initialize(String baseUrl) => dio = Dio(
    BaseOptions(
      baseUrl: baseUrl,
      receiveDataWhenStatusError: true,
    ),
  )..interceptors.add(
    InterceptorsWrapper(
      onRequest: (options, handler) {
        // wrap each request before it happends
        final token = CashHelper.prefs.get('token');
        if (token == null) return handler.next(options);
        final headers = Map<String, dynamic>.from(options.headers);
        if (headers["Authorization"] == null) {
          headers.addAll({"Authorization": "Bearer $token"});
        } else {
          headers.update('Authorization', (value) => "Bearer $token");
        }
        final newOptions = options.copyWith(headers: headers);
        handler.next(newOptions);
      },
    ),
  );


  static Future<Response> postData(
      {required Map<String, dynamic> data,
        String? token,
        required String url}) async {
    return await dio.post(
      url,
      queryParameters: {
        'url_mylang': CashHelper.prefs.get('local')?? 'en',
      },
      data: FormData.fromMap(data),
      options: Options(headers: {
        "Authorization": "Bearer $token",
      }),
    );
  }

  static Future<Response> getData(
      {Map<String, dynamic>? query, String? token, required String url}) async {
    return await dio.get(
      url,
      queryParameters: {
        'url_mylang': CashHelper.prefs.get('local')?? 'en',
      },

      options: Options(
        headers: {
          "Authorization": "Bearer $token",
        },
      ),
    );
  }

  static Future<Response> postDataFile(
      {Map<String, dynamic>? query,
        required FormData data,
        String? token,
        required String url}) async {
    return await dio.post(
      url,
      queryParameters: {
        'url_mylang': CashHelper.prefs.get('local')?? 'en',
      },
      data: data,
      options: Options(
        headers: {
          "Authorization": "Bearer $token",
          'Content-Type': 'multipart/form-data',
        },
      ),
    );
  }

}
