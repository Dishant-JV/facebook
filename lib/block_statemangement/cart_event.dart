import 'package:equatable/equatable.dart';

abstract class CartsEvents extends Equatable {
  @override
  //TODO:implement props
  List<Object> get props => [];
}

class ChangeNameEvents extends CartsEvents {
  final int count;

  ChangeNameEvents({required this.count});

  @override
  //TODO:implement props
  List<Object> get props => [count];
}