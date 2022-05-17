// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mobx_signup_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MobxSignUpModel on _MobxSignUpModel, Store {
  late final _$userDataListAtom =
      Atom(name: '_MobxSignUpModel.userDataList', context: context);

  @override
  ObservableList<UserData> get userDataList {
    _$userDataListAtom.reportRead();
    return super.userDataList;
  }

  @override
  set userDataList(ObservableList<UserData> value) {
    _$userDataListAtom.reportWrite(value, super.userDataList, () {
      super.userDataList = value;
    });
  }

  late final _$_MobxSignUpModelActionController =
      ActionController(name: '_MobxSignUpModel', context: context);

  @override
  dynamic addToList(UserData userData) {
    final _$actionInfo = _$_MobxSignUpModelActionController.startAction(
        name: '_MobxSignUpModel.addToList');
    try {
      return super.addToList(userData);
    } finally {
      _$_MobxSignUpModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic updateList(UserData userData, int index) {
    final _$actionInfo = _$_MobxSignUpModelActionController.startAction(
        name: '_MobxSignUpModel.updateList');
    try {
      return super.updateList(userData, index);
    } finally {
      _$_MobxSignUpModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
userDataList: ${userDataList}
    ''';
  }
}
