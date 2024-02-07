import 'package:equatable/equatable.dart';

class ViewItemsEvent extends Equatable {
  const ViewItemsEvent();

  @override
  List<Object> get props => [];
}

class SearchItem extends ViewItemsEvent {
  final String itemName;

  const SearchItem(this.itemName);

  @override
  List<Object> get props => [itemName];
}

class FetchItems extends ViewItemsEvent {}
