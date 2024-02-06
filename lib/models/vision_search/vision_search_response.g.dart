// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vision_search_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VisionSearchResponse _$VisionSearchResponseFromJson(
        Map<String, dynamic> json) =>
    VisionSearchResponse(
      image: json['image'] as String,
      products: (json['products'] as List<dynamic>)
          .map((e) => VisionSearchResults.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$VisionSearchResponseToJson(
        VisionSearchResponse instance) =>
    <String, dynamic>{
      'image': instance.image,
      'products': instance.products.map((e) => e.toJson()).toList(),
    };
