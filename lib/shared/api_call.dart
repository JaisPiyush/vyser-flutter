import 'package:dio/dio.dart';

class ApiCallGroup {
  ApiCallGroup(this.baseUrl) {
    handler = Dio(BaseOptions(baseUrl: baseUrl, headers: getHeaders()));
  }
  final String baseUrl;
  late Dio handler;

  Map<String, String> getHeaders() {
    return {
      'Content-Type': 'application/json',
    };
  }
}
