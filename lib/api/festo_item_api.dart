import 'package:vyser/api/festo_api.dart';
import 'package:vyser/models/vision_search_festo/vision_inventory_item_search_response.dart';

class ItemAPIClient {
  final ApiClient client;
  ItemAPIClient(this.client);

  Future<VisionInventoryItemSearchResponse> visionSearchInventory(
      String url) async {
    final res = await client.client
        .get('/item/search/', queryParameters: {'image_uri': url});
    return VisionInventoryItemSearchResponse.fromJson(res.data);
  }
}
