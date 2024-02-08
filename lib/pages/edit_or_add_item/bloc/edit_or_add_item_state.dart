import 'package:equatable/equatable.dart';
import 'package:vyser/models/item/editable_item.dart';

class EditOrAddItemState extends Equatable {
  const EditOrAddItemState();

  @override
  List<Object> get props => [];
}

class InitialEditOrAddItemState extends EditOrAddItemState {}

class FetchedEditableItemsEditOrAddItemState extends EditOrAddItemState {
  final List<EditableItem> items;

  const FetchedEditableItemsEditOrAddItemState(this.items);

  @override
  List<Object> get props => [items];
}

class FetchingEditableItemsFailedEditOrAddItemState
    extends EditOrAddItemState {}

class EditableItemWorkingEditOrAddItemState extends EditOrAddItemState {}

class EditableItemWorkingSuccessEditOrAddItemState extends EditOrAddItemState {}

class EditableItemWorkingFailedEditOrAddItemState extends EditOrAddItemState {
  final List<EditableItem> items;

  const EditableItemWorkingFailedEditOrAddItemState(this.items);

  @override
  List<Object> get props => [items];
}
