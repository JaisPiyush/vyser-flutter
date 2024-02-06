import 'package:dio/dio.dart';
import 'package:vyser/api/base_api.dart';
import 'package:vyser/models/product_set/product_set.dart';

class ProductSetAPI extends BaseAPI {
  ProductSetAPI({super.apiCallGroup}) : super(route: '/product-set');

  Future<List<ProductSet>> getProductSets(List<String> refs) async {
    final response = await apiCallGroup.getHandler().post(
          apiCallGroup.getBaseUrlWithSuffix(),
          data: {
            "references": refs,
          },
          options: Options(headers: await apiCallGroup.getHeaders()),
        );
    if (response.statusCode != 200) {
      throw Exception('Failed to get product sets');
    }
    return (response.data as List).map((e) => ProductSet.fromJson(e)).toList();
  }
}
