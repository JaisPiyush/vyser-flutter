import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';

class APICallGroup {
  APICallGroup(this.baseUrl) {
    handler = Dio(BaseOptions(baseUrl: getBaseUrlWithSuffix()));
  }

  final String baseUrl;
  late Dio handler;

  String getBaseUrlWithSuffix({String? suffix}) {
    if (suffix != null) {
      return baseUrl + suffix;
    }
    return baseUrl;
  }

  Future<Map<String, String>> getHeaders() async {
    Map<String, String> headers = {
      'Content-Type': 'application/json',
    };
    if (FirebaseAuth.instance.currentUser != null) {
      String? token = await FirebaseAuth.instance.currentUser!.getIdToken();
      if (token != null) {
        headers['Authorization'] = 'Bearer $token';
      }
    }
    return headers;
  }

  Dio getHandler() {
    return handler;
  }
}
