import 'dart:io';

import 'package:dio/dio.dart';
import 'package:vyser/api/festo_api.dart';
import 'package:vyser/api/festo_item_api.dart';
import 'package:vyser/bloc/sales_billing/sales_billing.state.dart';
import 'package:vyser/models/item.dart';
import 'package:vyser/models/vision_search_festo/vision_inventory_item_search_response.dart';
import 'package:vyser/models/vision_search_festo/vision_search_item_single_result.dart';
// import 'package:vyser/samples.dart';
import 'package:vyser/services/storage.service.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';

class _BoundingImagesAndItemsRecord {
  final List<String> localizedObjectImages;
  final Map<String, List<Item>> matchingItems;

  const _BoundingImagesAndItemsRecord(
      this.localizedObjectImages, this.matchingItems);
}

class SalesBillingCubit extends Cubit<SalesBillingState> {
  final ApiClient client;
  SalesBillingCubit(this.client) : super(SalesBillingInitialState());

  late VisionInventoryItemSearchResponse response;
  late Map<String, Item> selectedItems = {};

  _BoundingImagesAndItemsRecord getBoundingPolyToItemMapFromResponse(
      VisionInventoryItemSearchResponse response) {
    Map<String, List<Item>> matchingItems = {};
    List<String> images = [];
    for (int index = 0; index < response.results.length; index++) {
      InventoryItemVisionSingleSearchResult result = response.results[index];
      images.add(result.image);
      List<VisionSearchItemSingleResult> products = List.from(result.results);
      products.sort((a1, a2) => a1.score.compareTo(a2.score));
      List<String> productIds =
          products.map((e) => e.product_id).toSet().toList();
      List<Item> items = [];
      productIds.forEach((productId) {
        if (response.product_id_to_items_map[productId] != null) {
          items.addAll(response.product_id_to_items_map[productId]!);
        }
      });
      matchingItems[result.image] = items;
    }

    return _BoundingImagesAndItemsRecord(images, matchingItems);
  }

  void showImagePicker() {
    emit(SalesBillingImagePickerVisibleState());
  }

  void showSalesBillingVisionSearchBoundedImageWithBestMatchingItemVisible(
      VisionInventoryItemSearchResponse response,
      Map<String, Item> selectedItems_) {
    _BoundingImagesAndItemsRecord records =
        getBoundingPolyToItemMapFromResponse(response);
    if (selectedItems_.isEmpty) {
      records.matchingItems.entries.forEach((element) {
        selectedItems_[element.key] = element.value.first;
      });
    }

    selectedItems = selectedItems_;
    emit(SalesBillingVisionSearchBoundedImageWithBestMatchingItemVisible(
        response: response,
        localizedObjectImages: records.localizedObjectImages,
        localizedObjectToItemsMap: records.matchingItems,
        selectedItems: selectedItems));
  }

  void showSalesBillingVisionSearchMatchingItemsVisible(
      String localizedObjectImage,
      VisionInventoryItemSearchResponse response,
      Item? selectedItem) {
    _BoundingImagesAndItemsRecord records =
        getBoundingPolyToItemMapFromResponse(response);
    emit(SalesBillingVisionSearchMatchingItemsVisible(
        response: response,
        localizedObjectImage: localizedObjectImage,
        selectableItems: records.matchingItems[localizedObjectImage]!,
        selectedItem: selectedItem));
  }

  Future<void> visionSearchItemsFromInventory(String sourceImageUrl) async {
    emit(SalesBillingVisionSearchingProductState(sourceImageUrl));
    try {
      final itemAPIClient = ItemAPIClient(client);
      response = await itemAPIClient.visionSearchInventory(sourceImageUrl);
      showSalesBillingVisionSearchBoundedImageWithBestMatchingItemVisible(
          response, selectedItems);
    } on DioException catch (e) {
      emit(SalesBillingErrorState(
          e.response?.data.toString() ?? 'Unknown error'));
    }
  }

  void showVoucherCreationForm() {
    emit(SalesBillingVoucherFormVisibleState(selectedItems.values.toList()));
  }

  Future<void> uploadImageAndStartVisionSearch(XFile? file) async {
    emit(SalesBillingLoadingState());
    if (file == null) {
      emit(SalesBillingErrorState('Invalid or not image was selected'));
      return;
    }
    final storageService = StorageService();
    var ref = storageService.getFileStorageRefForUser(Uuid().v4(), file.name);
    storageService.uploadFile(ref, File(file.path),
        snapshotEventListener: (snapshot) async {
      if (snapshot.state == TaskState.success) {
        final url = await storageService.getDownloadURL(ref);
        await visionSearchItemsFromInventory(url);
      } else if (snapshot.state == TaskState.error) {
        emit(SalesBillingErrorState('Unknown error while uploading file'));
      }
    });
  }

  // Future<void> createSalesVoucher()
}
