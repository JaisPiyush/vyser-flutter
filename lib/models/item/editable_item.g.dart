// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'editable_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EditableItem _$EditableItemFromJson(Map<String, dynamic> json) => EditableItem(
      id: json['id'] as String,
      is_active: json['is_active'] as bool,
      price: (json['price'] as num).toDouble(),
      quantity: (json['quantity'] as num).toDouble(),
      reorder_level: (json['reorder_level'] as num).toDouble(),
      name: json['name'] as String?,
    );

Map<String, dynamic> _$EditableItemToJson(EditableItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'is_active': instance.is_active,
      'price': instance.price,
      'quantity': instance.quantity,
      'reorder_level': instance.reorder_level,
      'name': instance.name,
    };
