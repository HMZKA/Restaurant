import 'package:dio/dio.dart';
// you can find the backend here : https://github.com/HMZKA/feane

class DioHelper {
  static late Dio dio;
  static String baseUrl = 'http://192.168.43.123:8000';
  static init() {
    dio = Dio(BaseOptions(
        baseUrl: 'http://192.168.43.123:8000/api',
        headers: {'Accept': 'application/json'},
        receiveDataWhenStatusError: true));
  }

  static Future<Response> getData(String url,
      {Map<String, dynamic>? query}) async {
    return await dio.get(url, queryParameters: query);
  }

  static Future<Response> postData(String url,
      {Map<String, dynamic>? query, required Map<String, dynamic> data}) async {
    return await dio.post(url, queryParameters: query, data: data);
  }
}
