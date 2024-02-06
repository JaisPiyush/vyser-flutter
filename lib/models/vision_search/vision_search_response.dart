import 'package:json_annotation/json_annotation.dart';
import 'package:vyser/models/vision_search/vision_search_results.dart';

part 'vision_search_response.g.dart';

@JsonSerializable(explicitToJson: true)
class VisionSearchResponse {
  VisionSearchResponse({
    required this.image,
    required this.products,
  });

  final String image;
  final List<VisionSearchResults> products;

  factory VisionSearchResponse.fromJson(Map<String, dynamic> json) =>
      _$VisionSearchResponseFromJson(json);
  Map<String, dynamic> toJson() => _$VisionSearchResponseToJson(this);
}
