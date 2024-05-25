import 'package:equatable/equatable.dart';
import 'package:vyser/models/catalog_item.dart';
import 'package:vyser/models/vision_search_festo/vision_product_search_grouped_result.dart';

class VisionSearchState extends Equatable {
  @override
  List<Object?> get props => [];
}

class VisionSearchInitialState extends VisionSearchState {}

class VisionSearchLoadingState extends VisionSearchState {}

class VisionSearchErrorState extends VisionSearchState {
  final String errorMessage;

  VisionSearchErrorState(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}

class VisionSearchResultVisibleState extends VisionSearchState {
  final String sourceImageUrl;
  final List<VisionProductSearchGroupedResult> results;
  final Map<String, List<CatalogItem>> matchingCatalogItems;
  final Map<int, CatalogItem> selectedCatalogItem;

  VisionSearchResultVisibleState(
      {required this.sourceImageUrl,
      required this.results,
      required this.matchingCatalogItems,
      required this.selectedCatalogItem});

  @override
  List<Object?> get props =>
      [sourceImageUrl, results, matchingCatalogItems, selectedCatalogItem];
}

class BaseVisionSearchState extends Equatable {
  @override
  List<Object?> get props => [];
}

mixin BaseVisionSearchInitialMixin on BaseVisionSearchState {}

mixin BaseVisionSearchLoadingMixin on BaseVisionSearchState {}

mixin BaseVisionSearchErrorMixin on BaseVisionSearchState {
  late String message;
}

mixin BaseVisionSearchResultsVisibleMixin on BaseVisionSearchState {
  late int itemCount;
}
