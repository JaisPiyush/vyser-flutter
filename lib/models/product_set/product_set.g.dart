// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_set.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductSet _$ProductSetFromJson(Map<String, dynamic> json) => ProductSet(
      id: json['id'] as String,
      name: json['name'] as String,
      created_at: json['created_at'] as String,
      brand: json['brand'] as String,
      attributes:
          Attributes.fromJson(json['attributes'] as Map<String, dynamic>),
      units: Units.fromJson(json['units'] as Map<String, dynamic>),
      display_images: (json['display_images'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      description: json['description'] as String,
      categories: (json['categories'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      is_item_group: json['is_item_group'] as bool,
      item_group_id: json['item_group_id'] as String?,
      product_set_id: json['product_set_id'] as String,
      product_id: json['product_id'] as String,
    );

Map<String, dynamic> _$ProductSetToJson(ProductSet instance) =>
    <String, dynamic>{
      'id': instance.id,
      'created_at': instance.created_at,
      'brand': instance.brand,
      'attributes': instance.attributes.toJson(),
      'units': instance.units.toJson(),
      'display_images': instance.display_images,
      'description': instance.description,
      'categories': instance.categories,
      'is_item_group': instance.is_item_group,
      'item_group_id': instance.item_group_id,
      'product_set_id': instance.product_set_id,
      'product_id': instance.product_id,
      'name': instance.name,
    };
