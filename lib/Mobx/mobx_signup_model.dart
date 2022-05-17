import 'package:facebook/Mobx/usse_data.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';

part 'mobx_signup_model.g.dart';

class MobxSignUpModel = _MobxSignUpModel with _$MobxSignUpModel;

abstract class _MobxSignUpModel with Store {
  @observable
  var userDataList = ObservableList<UserData>();

  @action
  addToList(UserData userData) {
    userDataList.add(userData);
  }

  @action
  updateList(UserData userData, int index) {
    userDataList[index] = userData;
  }
}
