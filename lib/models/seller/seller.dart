import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:vyser/models/location/location.dart';
import 'package:vyser/models/media_file/media_file.dart';

part 'seller.g.dart';

@JsonSerializable(explicitToJson: true)
class Seller extends Equatable {
  Seller({
    required this.descriptor_name,
    this.descriptor_media = const [],
    required this.descriptor_images,
    required this.is_store_active,
    this.locations = const [],
    this.attributes = const [],
    this.id,
    this.category_id,
    this.descriptor_code,
    this.descriptor_short_desc,
    this.descriptor_long_desc,
    this.uid,
  });

  String? id;
  String descriptor_name;
  String? descriptor_code;
  String? descriptor_short_desc;
  String? descriptor_long_desc;
  List<MediaFile> descriptor_media;
  List<String> descriptor_images;
  String? category_id;
  bool is_store_active;
  String? uid;
  List<Map<String, String>> attributes;
  List<Location> locations;

  factory Seller.fromJson(Map<String, dynamic> json) => _$SellerFromJson(json);
  Map<String, dynamic> toJson() => _$SellerToJson(this);

  @override
  List<Object?> get props => [
        id,
        descriptor_name,
        descriptor_code,
        descriptor_short_desc,
        descriptor_long_desc,
        descriptor_media,
        descriptor_images,
        category_id,
        is_store_active,
        uid,
        attributes,
        locations
      ];
}
