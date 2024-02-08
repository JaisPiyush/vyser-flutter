import 'package:equatable/equatable.dart';
import 'package:vyser/models/index.dart';

class EditOrAddItemEvent extends Equatable {
  const EditOrAddItemEvent();

  @override
  List<Object> get props => [];
}

class FetchEditableItemsEditOrAddItemEvent extends EditOrAddItemEvent {
  final List<String> ids;

  const FetchEditableItemsEditOrAddItemEvent(this.ids);

  @override
  List<Object> get props => [ids];
}

class SaveEditableItemsEditOrAddItemEvent extends EditOrAddItemEvent {
  final List<EditableItem> items;

  const SaveEditableItemsEditOrAddItemEvent(this.items);

  @override
  List<Object> get props => [items];
}
