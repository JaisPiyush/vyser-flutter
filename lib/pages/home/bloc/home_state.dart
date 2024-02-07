import 'package:equatable/equatable.dart';
import 'package:vyser/models/index.dart';

class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class FetchingSeller extends HomeState {}

class SellerFetched extends HomeState {
  final Seller seller;

  const SellerFetched(this.seller);

  @override
  List<Object> get props => [seller];
}

class FetchingSellerFailed extends HomeState {}
