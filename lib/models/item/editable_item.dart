import 'package:json_annotation/json_annotation.dart';

part 'editable_item.g.dart';

@JsonSerializable(explicitToJson: true)
class EditableItem {
  EditableItem({
    required this.id,
    required this.is_active,
    required this.price,
    required this.quantity,
    required this.reorder_level,
    this.name,
  });

  String id;
  bool is_active;
  double price;
  double quantity;
  double reorder_level;
  String? name;

  factory EditableItem.fromJson(Map<String, dynamic> json) =>
      _$EditableItemFromJson(json);
  Map<String, dynamic> toJson() => _$EditableItemToJson(this);
}
