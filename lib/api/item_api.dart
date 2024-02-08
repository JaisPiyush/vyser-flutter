import 'package:dio/dio.dart';
import 'package:vyser/api/base_api.dart';
import 'package:vyser/models/index.dart';

class ItemAPI extends BaseAPI {
  ItemAPI({super.apiCallGroup}) : super(route: '/item');

  Future<List<Item>> findById(String itemId) async {
    final response = await apiCallGroup.getHandler().get(
          getBaseUrlWithSuffix(),
          queryParameters: {
            'item_id': itemId,
          },
          options: Options(headers: await apiCallGroup.getHeaders()),
        );
    if (response.statusCode != 200) {
      throw Exception('Failed to find item');
    }
    return (response.data['items'] as List)
        .map((e) => Item.fromJson(e))
        .toList();
  }

  Future<List<Item>> getAllSellersItems() async {
    final response = await apiCallGroup.getHandler().get(
          getBaseUrlWithSuffix(),
          options: Options(headers: await apiCallGroup.getHeaders()),
        );
    if (response.statusCode != 200) {
      throw Exception('Failed to get items');
    }
    final items =
        (response.data['items'] as List).map((e) => Item.fromJson(e)).toList();
    return items;
  }

  Future<List<EditableItem>> getEditableDetails(List<String> ids) async {
    final response = await apiCallGroup.getHandler().post(
          getBaseUrlWithSuffix(suffix: '/editable'),
          data: {
            'ids': ids,
          },
          options: Options(headers: await apiCallGroup.getHeaders()),
        );
    if (response.statusCode != 200) {
      throw Exception('Failed to get items');
    }
    return (response.data['items'] as List)
        .map((e) => EditableItem.fromJson(e))
        .toList();
  }

  Future<List<Item>> create(List<CreateItem> items) async {
    final response = await apiCallGroup.getHandler().post(
          getBaseUrlWithSuffix(suffix: '/bulk'),
          data: {
            'items': items.map((e) => e.toJson()).toList(),
          },
          options: Options(headers: await apiCallGroup.getHeaders()),
        );
    if (response.statusCode != 201) {
      throw Exception('Failed to create items');
    }
    return (response.data['items'] as List)
        .map((e) => Item.fromJson(e))
        .toList();
  }
}
