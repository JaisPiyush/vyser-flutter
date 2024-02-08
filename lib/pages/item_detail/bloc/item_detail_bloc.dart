import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:vyser/pages/item_detail/bloc/item_detail_events.dart';
import 'package:vyser/pages/item_detail/bloc/item_detail_state.dart';
import 'package:vyser/route_args.dart';
import 'package:vyser/shared/api_call.dart';

final getIt = GetIt.instance;

class ItemDetailBloc extends Bloc<ItemDetailEvent, ItemDetailState> {
  ItemDetailBloc(this.args) : super(ItemDetailInitialState()) {
    on<FetchItemDetailEvent>(_onFetchItemDetail);
  }

  final ItemDetailArgument args;

  final itemAPI = getIt.get<APICallGroup>().itemAPI!;

  Future<void> _onFetchItemDetail(
      FetchItemDetailEvent event, Emitter<ItemDetailState> emit) async {
    emit(ItemDetailInitialState());
    try {
      if (args.item != null) {
        emit(FetchedItemDetailState(item: args.item!));
        return;
      }
      final items = await itemAPI.findById(args.itemId);
      if (items.isEmpty) {
        emit(FetchedItemDetailFailedState());
        return;
      }
      emit(FetchedItemDetailState(item: items.first));
    } catch (e) {
      // print(e);
      emit(FetchedItemDetailFailedState());
    }
  }
}
