// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'seller.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Seller _$SellerFromJson(Map<String, dynamic> json) => Seller(
      descriptor_name: json['descriptor_name'] as String,
      descriptor_media: (json['descriptor_media'] as List<dynamic>?)
              ?.map((e) => MediaFile.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      descriptor_images: (json['descriptor_images'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      is_store_active: json['is_store_active'] as bool,
      locations: (json['locations'] as List<dynamic>?)
              ?.map((e) => Location.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      attributes: (json['attributes'] as List<dynamic>?)
              ?.map((e) => Map<String, String>.from(e as Map))
              .toList() ??
          const [],
      id: json['id'] as String?,
      category_id: json['category_id'] as String?,
      descriptor_code: json['descriptor_code'] as String?,
      descriptor_short_desc: json['descriptor_short_desc'] as String?,
      descriptor_long_desc: json['descriptor_long_desc'] as String?,
      uid: json['uid'] as String?,
    );

Map<String, dynamic> _$SellerToJson(Seller instance) => <String, dynamic>{
      'id': instance.id,
      'descriptor_name': instance.descriptor_name,
      'descriptor_code': instance.descriptor_code,
      'descriptor_short_desc': instance.descriptor_short_desc,
      'descriptor_long_desc': instance.descriptor_long_desc,
      'descriptor_media':
          instance.descriptor_media.map((e) => e.toJson()).toList(),
      'descriptor_images': instance.descriptor_images,
      'category_id': instance.category_id,
      'is_store_active': instance.is_store_active,
      'uid': instance.uid,
      'attributes': instance.attributes,
      'locations': instance.locations.map((e) => e.toJson()).toList(),
    };
