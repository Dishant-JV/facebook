import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';

part 'demo_mobx.g.dart';

class DemoMobx  = _DemoMobx with _$DemoMobx;

abstract class _DemoMobx with Store {
  @observable
  int i = 0;

  @action
  increment() {
    i=i+1;
  }
}
