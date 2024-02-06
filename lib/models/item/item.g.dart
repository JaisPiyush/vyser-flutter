// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Item _$ItemFromJson(Map<String, dynamic> json) => Item(
      id: json['id'] as String,
      name: json['name'] as String,
      product_set_reference: json['product_set_reference'] as String,
      descriptor_name: json['descriptor_name'] as String,
      descriptor_code: json['descriptor_code'] as String?,
      descriptor_short_desc: json['descriptor_short_desc'] as String?,
      descriptor_long_desc: json['descriptor_long_desc'] as String?,
      descriptor_media: (json['descriptor_media'] as List<dynamic>?)
              ?.map((e) => MediaFile.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      descriptor_images: (json['descriptor_images'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      descriptor_additional_desc:
          (json['descriptor_additional_desc'] as List<dynamic>?)
                  ?.map((e) => Map<String, String>.from(e as Map))
                  .toList() ??
              const [],
      creator: json['creator'] as String,
      price: (json['price'] as num).toDouble(),
      price_currency: json['price_currency'] as String,
      quantity: (json['quantity'] as num).toDouble(),
      reorder_level: (json['reorder_level'] as num).toDouble(),
      category_ids: (json['category_ids'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      unit: json['unit'] as String,
      attributes:
          Attributes.fromJson(json['attributes'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ItemToJson(Item instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'product_set_reference': instance.product_set_reference,
      'descriptor_name': instance.descriptor_name,
      'descriptor_code': instance.descriptor_code,
      'descriptor_short_desc': instance.descriptor_short_desc,
      'descriptor_long_desc': instance.descriptor_long_desc,
      'descriptor_media':
          instance.descriptor_media.map((e) => e.toJson()).toList(),
      'descriptor_images': instance.descriptor_images,
      'descriptor_additional_desc': instance.descriptor_additional_desc,
      'creator': instance.creator,
      'price': instance.price,
      'price_currency': instance.price_currency,
      'quantity': instance.quantity,
      'reorder_level': instance.reorder_level,
      'category_ids': instance.category_ids,
      'unit': instance.unit,
      'attributes': instance.attributes.toJson(),
    };
