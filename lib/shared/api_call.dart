import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:vyser/api/item_api.dart';
import 'package:vyser/api/message_api.dart';
import 'package:vyser/api/product_set_api.dart';
import 'package:vyser/api/search_api.dart';
import 'package:vyser/api/seller_api.dart';
import 'package:vyser/api/utils_api.dart';

class APICallGroup {
  APICallGroup(this.baseUrl) {
    handler = Dio(BaseOptions(baseUrl: getBaseUrlWithSuffix()));
    sellerAPI = SellerAPI(apiCallGroup: this);
    itemAPI = ItemAPI(apiCallGroup: this);
    messageAPI = MessageAPI(apiCallGroup: this);
    productSetAPI = ProductSetAPI(apiCallGroup: this);
    searchAPI = SearchAPI(apiCallGroup: this);
    utilsAPI = UtilsAPI(apiCallGroup: this);
  }

  final String baseUrl;
  late Dio handler;

  SellerAPI? sellerAPI;
  ItemAPI? itemAPI;
  MessageAPI? messageAPI;
  ProductSetAPI? productSetAPI;
  SearchAPI? searchAPI;
  UtilsAPI? utilsAPI;

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
