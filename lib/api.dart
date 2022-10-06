import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:cookie_jar/cookie_jar.dart';

Dio _makeDio() {
  Dio dio = Dio();
  var cookieJar = CookieJar();
  dio.interceptors.add(CookieManager(cookieJar));
  return dio;
}

final Dio _dio = _makeDio();
const String _BASE_URL = 'http://10.0.2.2:8000';

Future<Response> login(String username, String password) async {
  final FormData formData = FormData.fromMap({
    'username': username,
    'password': password,
  });
  Response response = await _dio.post('$_BASE_URL/api/login', data: formData);
  return response;
}

Future<Response> whoami() async {
  return _dio.get('$_BASE_URL/api/whoami');
}

Future<Response> logout() async {
  return _dio.post('$_BASE_URL/api/logout');
}
