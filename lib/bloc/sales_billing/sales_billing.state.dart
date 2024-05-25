// ignore_for_file: must_be_immutable, non_constant_identifier_names

import 'package:vyser/bloc/vision_search/vision_search.state.dart';
import 'package:vyser/models/item.dart';
import 'package:vyser/models/vision_search_festo/vision_inventory_item_search_response.dart';

class SalesBillingState extends BaseVisionSearchState {}

class SalesBillingInitialState extends SalesBillingState {}

class SalesBillingLoadingState extends SalesBillingState {}

class SalesBillingImagePickerVisibleState extends SalesBillingState {}

class SalesBillingVisionSearchState extends SalesBillingState
    with BaseVisionSearchInitialMixin {}

class SalesBillingErrorState extends SalesBillingVisionSearchState
    with BaseVisionSearchErrorMixin {
  @override
  final String message;
  SalesBillingErrorState(this.message);

  @override
  List<Object?> get props => [message];
}

class SalesBillingVisionSearchingProductState
    extends SalesBillingVisionSearchState with BaseVisionSearchLoadingMixin {
  final String sourceImageUrl;
  SalesBillingVisionSearchingProductState(this.sourceImageUrl);

  @override
  List<Object?> get props => [sourceImageUrl];
}

class SalesBillingVisionSearchResultsVisibleState
    extends SalesBillingVisionSearchState
    with BaseVisionSearchResultsVisibleMixin {
  final VisionInventoryItemSearchResponse response;

  SalesBillingVisionSearchResultsVisibleState({required this.response}) {
    itemCount = response.results.length;
  }

  @override
  List<Object?> get props => [response, itemCount];
}

class SalesBillingVisionSearchBoundedImageWithBestMatchingItemVisible
    extends SalesBillingVisionSearchResultsVisibleState {
  final List<String> localizedObjectImages;
  final Map<String, List<Item>> localizedObjectToItemsMap;
  final Map<String, Item> selectedItems;

  SalesBillingVisionSearchBoundedImageWithBestMatchingItemVisible({
    required super.response,
    required this.localizedObjectImages,
    required this.localizedObjectToItemsMap,
    required this.selectedItems,
  }) {
    itemCount = localizedObjectImages.length;
  }

  @override
  List<Object?> get props => [
        response,
        localizedObjectImages,
        itemCount,
        localizedObjectToItemsMap,
        selectedItems
      ];
}

class SalesBillingVisionSearchMatchingItemsVisible
    extends SalesBillingVisionSearchResultsVisibleState {
  final String localizedObjectImage;
  final List<Item> selectableItems;
  final Item? selectedItem;
  SalesBillingVisionSearchMatchingItemsVisible(
      {required super.response,
      required this.localizedObjectImage,
      required this.selectableItems,
      this.selectedItem}) {
    itemCount = selectableItems.length;
  }

  @override
  List<Object?> get props => [
        response,
        itemCount,
        localizedObjectImage,
        selectableItems,
        selectedItem
      ];
}

class SalesBillingVoucherFormVisibleState extends SalesBillingState {
  final List<Item> items;
  SalesBillingVoucherFormVisibleState(this.items);

  @override
  List<Object?> get props => [items];
}

class SalesBillingVoucherCreationCompleted extends SalesBillingState {}
