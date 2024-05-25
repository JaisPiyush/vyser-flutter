// ignore_for_file: non_constant_identifier_names

import 'package:vyser/models/item.dart';
import 'package:vyser/models/vision_search_festo/vision_search_item_single_result.dart';
import 'package:json_annotation/json_annotation.dart';

part 'vision_inventory_item_search_response.g.dart';

@JsonSerializable()
class InventoryItemVisionSingleSearchResult {
  final String image;
  final List<VisionSearchItemSingleResult> results;

  const InventoryItemVisionSingleSearchResult(
      {required this.image, required this.results});

  factory InventoryItemVisionSingleSearchResult.fromJson(
          Map<String, dynamic> json) =>
      _$InventoryItemVisionSingleSearchResultFromJson(json);

  Map<String, dynamic> toJson() =>
      _$InventoryItemVisionSingleSearchResultToJson(this);
}

@JsonSerializable()
class VisionInventoryItemSearchResponse {
  final List<InventoryItemVisionSingleSearchResult> results;
  final Map<String, List<Item>> product_id_to_items_map;

  const VisionInventoryItemSearchResponse(
      {required this.product_id_to_items_map, required this.results});

  factory VisionInventoryItemSearchResponse.fromJson(
          Map<String, dynamic> json) =>
      _$VisionInventoryItemSearchResponseFromJson(json);

  Map<String, dynamic> toJson() =>
      _$VisionInventoryItemSearchResponseToJson(this);
}
