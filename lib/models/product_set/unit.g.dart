// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unit.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Unit _$UnitFromJson(Map<String, dynamic> json) => Unit(
      key: json['key'] as String,
      price: (json['price'] as num?)?.toDouble(),
      measure: json['measure'] as String,
    );

Map<String, dynamic> _$UnitToJson(Unit instance) => <String, dynamic>{
      'key': instance.key,
      'price': instance.price,
      'measure': instance.measure,
    };
