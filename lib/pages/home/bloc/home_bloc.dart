import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:vyser/pages/home/bloc/home_events.dart';
import 'package:vyser/pages/home/bloc/home_state.dart';
import 'package:vyser/shared/api_call.dart';

final getIt = GetIt.instance;

class HomeBloc extends Bloc<HomeEvents, HomeState> {
  HomeBloc() : super(FetchingSeller()) {
    on<FetchSeller>(_onFetchSeller);
  }

  final sellerAPI = getIt.get<APICallGroup>().sellerAPI!;

  FutureOr<void> _onFetchSeller(
      FetchSeller event, Emitter<HomeState> emit) async {
    emit(FetchingSeller());
    try {
      final seller = await sellerAPI.getSeller();
      emit(SellerFetched(seller));
    } catch (e) {
      emit(FetchingSellerFailed());
    }
  }
}
