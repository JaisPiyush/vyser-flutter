import 'package:equatable/equatable.dart';
import 'package:vyser/models/index.dart';

class ItemDetailState extends Equatable {
  const ItemDetailState();

  @override
  List<Object?> get props => [];
}

class ItemDetailInitialState extends ItemDetailState {}

class FetchedItemDetailState extends ItemDetailState {
  final Item item;
  const FetchedItemDetailState({required this.item});

  @override
  List<Object?> get props => [item];
}

class FetchedItemDetailFailedState extends ItemDetailState {}
