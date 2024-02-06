import 'package:dio/dio.dart';

import 'package:vyser/api/base_api.dart';
import 'package:vyser/models/index.dart';

class SellerAPI extends BaseAPI {
  SellerAPI({super.apiCallGroup}) : super(route: '/seller');

  Future<Seller> getSeller() async {
    final response = await apiCallGroup.getHandler().get(
          apiCallGroup.getBaseUrlWithSuffix(),
          options: Options(headers: await apiCallGroup.getHeaders()),
        );
    if (response.statusCode != 200) {
      throw Exception('Failed to get seller');
    }
    return Seller.fromJson(response.data);
  }

  Future<void> registerSeller(Seller seller) async {
    final response = await apiCallGroup.getHandler().post(
          apiCallGroup.getBaseUrlWithSuffix(),
          data: seller.toJson(),
          options: Options(headers: await apiCallGroup.getHeaders()),
        );
    if (response.statusCode != 201) {
      throw Exception('Failed to register seller');
    }
  }

  Future<void> updateSeller(bool isStoreActive) async {
    final response = await apiCallGroup.getHandler().put(
          apiCallGroup.getBaseUrlWithSuffix(),
          data: {
            "is_store_active": isStoreActive,
          },
          options: Options(headers: await apiCallGroup.getHeaders()),
        );
    if (response.statusCode != 200) {
      throw Exception('Failed to update seller');
    }
  }
}
