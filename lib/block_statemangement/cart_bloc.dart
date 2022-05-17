import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'cart_event.dart';
import 'cart_states.dart';

class CartBloc extends Bloc<CartsEvents, CartsStates> {
  CartBloc() : super(CartsStates()) {
    on<ChangeNameEvents>(chnageNameEvent);
  }

  FutureOr<void> chnageNameEvent(
      ChangeNameEvents event, Emitter<CartsStates> emit) {
    emit(ChangeNameStates(count: event.count));
  }
}
