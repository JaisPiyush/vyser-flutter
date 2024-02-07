import 'package:equatable/equatable.dart';
import 'package:vyser/models/index.dart';

class ViewItemState extends Equatable {
  const ViewItemState();

  @override
  List<Object> get props => [];
}

// Write all states using views_items_state.dart as a reference
class ViewItemInitial extends ViewItemState {}

class ViewItemFetchedItems extends ViewItemState {
  final List<Item> items;

  const ViewItemFetchedItems(this.items);

  @override
  List<Object> get props => [items];
}

class ViewItemsFetchingFailed extends ViewItemState {}
