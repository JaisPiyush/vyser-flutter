import 'package:json_annotation/json_annotation.dart';
import 'package:vyser/models/vision_search/vision_search_single_result.dart';

part 'vision_search_results.g.dart';

@JsonSerializable(explicitToJson: true)
class VisionSearchResults {
  VisionSearchResults({
    required this.results,
  });

  final List<VisionSearchSingleResult> results;

  factory VisionSearchResults.fromJson(Map<String, dynamic> json) =>
      _$VisionSearchResultsFromJson(json);
  Map<String, dynamic> toJson() => _$VisionSearchResultsToJson(this);
}
