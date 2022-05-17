// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'demo_mobx.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$DemoMobx on _DemoMobx, Store {
  late final _$iAtom = Atom(name: '_DemoMobx.i', context: context);

  @override
  int get i {
    _$iAtom.reportRead();
    return super.i;
  }

  @override
  set i(int value) {
    _$iAtom.reportWrite(value, super.i, () {
      super.i = value;
    });
  }

  late final _$_DemoMobxActionController =
      ActionController(name: '_DemoMobx', context: context);

  @override
  dynamic increment() {
    final _$actionInfo =
        _$_DemoMobxActionController.startAction(name: '_DemoMobx.increment');
    try {
      return super.increment();
    } finally {
      _$_DemoMobxActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
i: ${i}
    ''';
  }
}
