import 'package:equatable/equatable.dart';

 class CartsStates extends Equatable {
  @override
  //TODO:implement props
  List<Object> get props => [];
}

class ChangeNameStates extends CartsStates {
  late final int count;

  ChangeNameStates({this.count=0});

  @override
  //TODO:implement props
  List<Object> get props => [count];
}
