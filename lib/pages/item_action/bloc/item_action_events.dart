import 'package:equatable/equatable.dart';
import 'package:vyser/models/vision_search/index.dart';

class ItemActionEvents extends Equatable {
  @override
  List<Object> get props => [];
}

class ShowSelectedResultsForIdentifiedProductEvent extends ItemActionEvents {
  final VisionSearchResults results;
  final String ref;

  ShowSelectedResultsForIdentifiedProductEvent(this.results, this.ref);

  @override
  List<Object> get props => [results];
}

class SearchProductEvent extends ItemActionEvents {}
