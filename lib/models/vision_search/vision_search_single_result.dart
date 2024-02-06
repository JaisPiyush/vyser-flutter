import 'package:json_annotation/json_annotation.dart';

part 'vision_search_single_result.g.dart';

@JsonSerializable()
class VisionSearchSingleResult {
  VisionSearchSingleResult({
    required this.product_labels,
    required this.productReference,
    required this.productCodeFromDb,
    required this.name,
    required this.score,
    required this.image,
    required this.is_item_group,
    this.item_group_id,
    required this.is_item_in_catalog,
    this.item_id,
  });

  final List<Map<String, String>> product_labels;

  @JsonKey(name: 'name')
  final String productReference;

  @JsonKey(name: 'display_name')
  final String productCodeFromDb;

  @JsonKey(name: 'description')
  final String name;

  final double score;

  final String image;

  final bool is_item_group;

  final String? item_group_id;
  final bool is_item_in_catalog;
  final String? item_id;

  factory VisionSearchSingleResult.fromJson(Map<String, dynamic> json) =>
      _$VisionSearchSingleResultFromJson(json);
  Map<String, dynamic> toJson() => _$VisionSearchSingleResultToJson(this);
}
