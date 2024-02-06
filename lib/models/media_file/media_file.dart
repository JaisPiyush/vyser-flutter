import 'package:json_annotation/json_annotation.dart';

part 'media_file.g.dart';

@JsonSerializable()
class MediaFile {
  MediaFile({required this.mimetype, required this.url});

  final String mimetype;
  final String url;

  factory MediaFile.fromJson(Map<String, dynamic> json) =>
      _$MediaFileFromJson(json);
  Map<String, dynamic> toJson() => _$MediaFileToJson(this);
}
