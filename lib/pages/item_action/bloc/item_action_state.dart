import 'package:equatable/equatable.dart';
import 'package:vyser/models/index.dart';

class ItemActionState extends Equatable {
  @override
  List<Object> get props => [];
}

class ItemActionInitial extends ItemActionState {}

class ShowVisionSearchResponseState extends ItemActionState {
  final VisionSearchResponse response;

  ShowVisionSearchResponseState(this.response);

  @override
  List<Object> get props => [response];
}

class SearchProductFailedState extends ItemActionState {}

class ShowSelectedResultsForIdentifiedProductState extends ItemActionState {
  final VisionSearchResults results;
  final String ref;

  ShowSelectedResultsForIdentifiedProductState(this.results, this.ref);

  @override
  List<Object> get props => [results];
}
