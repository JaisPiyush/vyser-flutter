import 'package:json_annotation/json_annotation.dart';

part 'storage_model.g.dart';

@JsonSerializable()
class StorageModel {
  StorageModel({
    required this.url,
    required this.gcSchemaUri,
  });

  final String url;
  final String gcSchemaUri;

  factory StorageModel.fromJson(Map<String, dynamic> json) =>
      _$StorageModelFromJson(json);
  Map<String, dynamic> toJson() => _$StorageModelToJson(this);
}
