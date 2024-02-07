import 'package:dio/dio.dart';
import 'package:vyser/api/base_api.dart';
import 'package:vyser/models/index.dart';

class SearchAPI extends BaseAPI {
  SearchAPI({super.apiCallGroup}) : super(route: '/search/item');

  Future<List<Item>> textSearch(String text) async {
    final response = await apiCallGroup.getHandler().post(
          getBaseUrlWithSuffix(suffix: '/text'),
          data: {
            "name": text,
          },
          options: Options(headers: await apiCallGroup.getHeaders()),
        );
    if (response.statusCode != 201) {
      throw Exception('Failed to search items');
    }
    return (response.data['items'] as List)
        .map((e) => Item.fromJson(e))
        .toList();
  }

  Future<VisionSearchResponse> globalVisionSearch(String image) async {
    final response = await apiCallGroup.getHandler().post(
          getBaseUrlWithSuffix(suffix: '/vision/global'),
          data: {
            "image": image,
          },
          options: Options(headers: await apiCallGroup.getHeaders()),
        );
    if (response.statusCode != 201) {
      throw Exception('Failed to search items');
    }
    return VisionSearchResponse.fromJson(response.data);
  }

  Future<VisionSearchResponse> catalogVisionSearch(String image) async {
    final response = await apiCallGroup.getHandler().post(
          getBaseUrlWithSuffix(suffix: '/vision/catalog'),
          data: {
            "image": image,
          },
          options: Options(headers: await apiCallGroup.getHeaders()),
        );
    if (response.statusCode != 201) {
      throw Exception('Failed to search items');
    }
    return VisionSearchResponse.fromJson(response.data);
  }
}
