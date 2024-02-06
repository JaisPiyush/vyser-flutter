import 'package:json_annotation/json_annotation.dart';
import 'package:vyser/models/item/attributes.dart';
import 'package:vyser/models/media_file/media_file.dart';

part 'create_item.g.dart';

@JsonSerializable(explicitToJson: true)
class CreateItem {
  CreateItem(
      {required this.name,
      required this.product_set_reference,
      required this.descriptor_name,
      this.descriptor_code,
      this.descriptor_short_desc,
      this.descriptor_long_desc,
      required this.descriptor_media,
      required this.descriptor_images,
      required this.descriptor_additional_desc,
      required this.creator,
      required this.price,
      required this.price_currency,
      required this.quantity,
      required this.reorder_level,
      required this.category_ids,
      required this.unit,
      required this.attributes});

  String name;
  String product_set_reference;
  String descriptor_name;
  String? descriptor_code;
  String? descriptor_short_desc;
  String? descriptor_long_desc;
  List<MediaFile> descriptor_media;
  List<String> descriptor_images;
  List<Map<String, String>> descriptor_additional_desc;
  String creator;
  double price;
  String price_currency;
  double quantity;
  double reorder_level;
  List<String> category_ids;
  String unit;
  Attributes attributes;

  factory CreateItem.fromJson(Map<String, dynamic> data) =>
      _$CreateItemFromJson(data);
  Map<String, dynamic> toJson() => _$CreateItemToJson(this);
}
