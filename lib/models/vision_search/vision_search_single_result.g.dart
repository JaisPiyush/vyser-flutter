// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vision_search_single_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VisionSearchSingleResult _$VisionSearchSingleResultFromJson(
        Map<String, dynamic> json) =>
    VisionSearchSingleResult(
      product_labels: (json['product_labels'] as List<dynamic>)
          .map((e) => Map<String, String>.from(e as Map))
          .toList(),
      productReference: json['name'] as String,
      productCodeFromDb: json['display_name'] as String,
      name: json['description'] as String,
      score: (json['score'] as num).toDouble(),
      image: json['image'] as String,
      is_item_group: json['is_item_group'] as bool,
      item_group_id: json['item_group_id'] as String?,
      is_item_in_catalog: json['is_item_in_catalog'] as bool,
      item_id: json['item_id'] as String?,
    );

Map<String, dynamic> _$VisionSearchSingleResultToJson(
        VisionSearchSingleResult instance) =>
    <String, dynamic>{
      'product_labels': instance.product_labels,
      'name': instance.productReference,
      'display_name': instance.productCodeFromDb,
      'description': instance.name,
      'score': instance.score,
      'image': instance.image,
      'is_item_group': instance.is_item_group,
      'item_group_id': instance.item_group_id,
      'is_item_in_catalog': instance.is_item_in_catalog,
      'item_id': instance.item_id,
    };
