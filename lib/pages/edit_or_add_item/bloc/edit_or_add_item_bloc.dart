import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:vyser/models/index.dart';
import 'package:vyser/pages/edit_or_add_item/bloc/edit_or_add_item_event.dart';
import 'package:vyser/pages/edit_or_add_item/bloc/edit_or_add_item_state.dart';
import 'package:vyser/route_args.dart';
import 'package:vyser/shared/api_call.dart';
import 'package:vyser/shared/custom_actions.dart';

final getIt = GetIt.instance;

class EditOrAddItemBloc extends Bloc<EditOrAddItemEvent, EditOrAddItemState> {
  EditOrAddItemBloc(this.args) : super(InitialEditOrAddItemState()) {
    on<FetchEditableItemsEditOrAddItemEvent>(_onFetchEditableItems);
    on<SaveEditableItemsEditOrAddItemEvent>(_onSaveEditableItems);
  }

  final productSetAPI = getIt.get<APICallGroup>().productSetAPI!;
  final itemAPI = getIt.get<APICallGroup>().itemAPI!;
  final customActions = getIt.get<CustomActions>();

  final addItemsActionId = 'addItems';
  final editItemsActionId = 'editItems';

  final EditOrItemsArgument args;
  List<ProductSet> _fetchedProductSets = [];
  List<EditableItem> _editableProducts = [];

  List<EditableItem> get editableItems => (args.actionId == addItemsActionId)
      ? customActions.getEditableItemFromProductSet(_fetchedProductSets)
      : _editableProducts;

  Future<void> _onFetchProductSet(FetchEditableItemsEditOrAddItemEvent event,
      Emitter<EditOrAddItemState> emit) async {
    emit(InitialEditOrAddItemState());
    try {
      _fetchedProductSets = [];
      final productSets = await productSetAPI.getProductSets(event.ids);
      _fetchedProductSets = productSets;
      emit(FetchedEditableItemsEditOrAddItemState(editableItems));
    } catch (e) {
      emit(FetchingEditableItemsFailedEditOrAddItemState());
    }
  }

  Future<void> _onFetchEditableItems(FetchEditableItemsEditOrAddItemEvent event,
      Emitter<EditOrAddItemState> emit) async {
    emit(InitialEditOrAddItemState());
    try {
      if (args.actionId == addItemsActionId) {
        return await _onFetchProductSet(event, emit);
      }
      _editableProducts = [];
      final items = await itemAPI.getEditableDetails(event.ids);
      _editableProducts = items;
      emit(FetchedEditableItemsEditOrAddItemState(editableItems));
    } catch (e) {
      emit(FetchingEditableItemsFailedEditOrAddItemState());
    }
  }

  Future<void> _onCreateEditableItems(SaveEditableItemsEditOrAddItemEvent event,
      Emitter<EditOrAddItemState> emit) async {
    emit(EditableItemWorkingEditOrAddItemState());
    try {
      final createableItems = customActions.getCreateItemStructFromEditableItem(
          _fetchedProductSets, event.items);
      await itemAPI.create(createableItems);
      emit(EditableItemWorkingSuccessEditOrAddItemState());
    } catch (e) {
      emit(EditableItemWorkingFailedEditOrAddItemState(event.items));
    }
  }

  Future<void> _onSaveEditableItems(SaveEditableItemsEditOrAddItemEvent event,
      Emitter<EditOrAddItemState> emit) async {
    emit(EditableItemWorkingEditOrAddItemState());
    try {
      if (args.actionId == addItemsActionId) {
        return await _onCreateEditableItems(event, emit);
      }
      emit(EditableItemWorkingSuccessEditOrAddItemState());
    } catch (e) {
      emit(EditableItemWorkingFailedEditOrAddItemState(event.items));
    }
  }
}
