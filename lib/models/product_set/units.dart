import 'package:json_annotation/json_annotation.dart';
import 'package:vyser/models/product_set/unit.dart';

part 'units.g.dart';

@JsonSerializable(explicitToJson: true)
class Units {
  Units({required this.units});
  final List<Unit> units;

  factory Units.fromJson(Map<String, dynamic> json) => _$UnitsFromJson(json);
  Map<String, dynamic> toJson() => _$UnitsToJson(this);
}
