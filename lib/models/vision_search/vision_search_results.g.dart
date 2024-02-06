// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vision_search_results.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VisionSearchResults _$VisionSearchResultsFromJson(Map<String, dynamic> json) =>
    VisionSearchResults(
      results: (json['results'] as List<dynamic>)
          .map((e) =>
              VisionSearchSingleResult.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$VisionSearchResultsToJson(
        VisionSearchResults instance) =>
    <String, dynamic>{
      'results': instance.results.map((e) => e.toJson()).toList(),
    };
