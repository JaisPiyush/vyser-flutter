import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:vyser/models/index.dart';
import 'package:vyser/pages/item_action/bloc/item_action_events.dart';
import 'package:vyser/pages/item_action/bloc/item_action_state.dart';
import 'package:vyser/route_args.dart';
import 'package:vyser/shared/api_call.dart';
import 'package:vyser/shared/constants.dart';

final getIt = GetIt.instance;

class ItemActionBloc extends Bloc<ItemActionEvents, ItemActionState> {
  ItemActionBloc(this.args) : super(ItemActionInitial()) {
    on<SearchProductEvent>(_onSearchProduct);
    on<ShowSelectedResultsForIdentifiedProductEvent>(
        _onShowSelectedResultsForIdentifiedProduct);
  }

  final ItemActionArgument args;
  VisionSearchResponse? visionSearchResponse;
  Map<String, VisionSearchSingleResult> selectedResultsMap = {};

  final searchAPI = getIt.get<APICallGroup>().searchAPI!;

  bool itemSelectedForIdentifiedProduct(String itemId) {
    return selectedResultsMap.containsKey(itemId);
  }

  void selectItemForIdentifiedProduct(
      String ref, VisionSearchSingleResult result) {
    selectedResultsMap[ref] = result;
  }

  FutureOr<void> _onSearchProduct(
      SearchProductEvent event, Emitter<ItemActionState> emit) async {
    emit(ItemActionInitial());
    try {
      if (visionSearchResponse != null) {
        emit(ShowVisionSearchResponseState(visionSearchResponse!));
        return;
      }
      if (args.actionId == ActionId.AddItem) {
        visionSearchResponse =
            await searchAPI.globalVisionSearch(args.payload!.image!);
      } else {
        visionSearchResponse =
            await searchAPI.catalogVisionSearch(args.payload!.image!);
      }
      emit(ShowVisionSearchResponseState(visionSearchResponse!));
    } catch (e) {
      emit(SearchProductFailedState());
    }
  }

  FutureOr<void> _onShowSelectedResultsForIdentifiedProduct(
      ShowSelectedResultsForIdentifiedProductEvent event,
      Emitter<ItemActionState> emit) {
    emit(
        ShowSelectedResultsForIdentifiedProductState(event.results, event.ref));
  }
}
