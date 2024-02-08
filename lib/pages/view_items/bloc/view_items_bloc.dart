import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:vyser/pages/view_items/bloc/view_items_events.dart';
import 'package:vyser/pages/view_items/bloc/view_items_state.dart';
import 'package:vyser/shared/api_call.dart';

final getIt = GetIt.instance;

class ViewItemsBloc extends Bloc<ViewItemsEvent, ViewItemState> {
  ViewItemsBloc() : super(ViewItemInitial()) {
    on<SearchItem>(_onSearchItem);
    on<FetchItems>(_onFetchItems);
  }

  final itemsAPI = getIt<APICallGroup>().itemAPI!;
  final searchAPI = getIt<APICallGroup>().searchAPI!;

  Future<void> _onSearchItem(
      SearchItem event, Emitter<ViewItemState> emit) async {
    emit(ViewItemInitial());
    // print('coufl');
    try {
      final items = await searchAPI.textSearch(event.itemName);
      emit(ViewItemFetchedItems(items));
    } catch (e) {
      emit(ViewItemsFetchingFailed());
    }
  }

  Future<void> _onFetchItems(
      FetchItems event, Emitter<ViewItemState> emit) async {
    // print('called');
    emit(ViewItemInitial());
    try {
      final items = await itemsAPI.getAllSellersItems();
      // print(items);
      emit(ViewItemFetchedItems(items));
    } catch (e) {
      emit(ViewItemsFetchingFailed());
    }
  }
}
