// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'units.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Units _$UnitsFromJson(Map<String, dynamic> json) => Units(
      units: (json['units'] as List<dynamic>)
          .map((e) => Unit.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$UnitsToJson(Units instance) => <String, dynamic>{
      'units': instance.units.map((e) => e.toJson()).toList(),
    };
