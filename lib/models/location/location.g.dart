// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Location _$LocationFromJson(Map<String, dynamic> json) => Location(
      address: json['address'] as String,
      city: json['city'] as String,
      district: json['district'] as String,
      state: json['state'] as String,
      country: json['country'] as String,
      area_code: json['area_code'] as String,
      descriptor_name: json['descriptor_name'] as String,
      descriptor_code: json['descriptor_code'] as String,
      descriptor_short_desc: json['descriptor_short_desc'] as String,
      descriptor_long_desc: json['descriptor_long_desc'] as String,
      id: json['id'] as String?,
    );

Map<String, dynamic> _$LocationToJson(Location instance) => <String, dynamic>{
      'id': instance.id,
      'address': instance.address,
      'city': instance.city,
      'district': instance.district,
      'state': instance.state,
      'country': instance.country,
      'area_code': instance.area_code,
      'descriptor_name': instance.descriptor_name,
      'descriptor_code': instance.descriptor_code,
      'descriptor_short_desc': instance.descriptor_short_desc,
      'descriptor_long_desc': instance.descriptor_long_desc,
    };
