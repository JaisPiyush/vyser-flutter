import 'package:vyser/models/item/attributes.dart';
import 'package:vyser/models/product_set/units.dart';
import 'package:json_annotation/json_annotation.dart';

part 'product_set.g.dart';

@JsonSerializable(explicitToJson: true)
class ProductSet {
  ProductSet(
      {required this.id,
      required this.name,
      required this.created_at,
      required this.brand,
      required this.attributes,
      required this.units,
      required this.display_images,
      required this.description,
      required this.categories,
      required this.is_item_group,
      required this.item_group_id,
      required this.product_set_id,
      required this.product_id});

  final String id;
  final String created_at;
  final String brand;
  final Attributes attributes;
  final Units units;
  final List<String> display_images;
  final String description;
  final List<String> categories;
  final bool is_item_group;
  final String? item_group_id;
  final String product_set_id;
  final String product_id;
  final String name;

  factory ProductSet.fromJson(Map<String, dynamic> json) =>
      _$ProductSetFromJson(json);
  Map<String, dynamic> toJson() => _$ProductSetToJson(this);
}
