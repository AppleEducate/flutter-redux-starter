import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:MyUnifyMobile/ui/home/home_screen.dart';
// STARTER: import - do not remove comment
import 'package:MyUnifyMobile/redux/group/group_state.dart';

import 'package:MyUnifyMobile/redux/task/task_state.dart';

import 'package:MyUnifyMobile/redux/contact/contact_state.dart';

part 'ui_state.g.dart';

abstract class UIState implements Built<UIState, UIStateBuilder> {
  String get currentRoute;

  // STARTER: properties - do not remove comment
  GroupUIState get groupUIState;

  TaskUIState get taskUIState;

  ContactUIState get contactUIState;

  factory UIState() {
    return _$UIState._(
      //currentRoute: LoginScreen.route,
      currentRoute: HomeScreen.route,
      // STARTER: constructor - do not remove comment
      groupUIState: GroupUIState(),

      taskUIState: TaskUIState(),

      contactUIState: ContactUIState(),
    );
  }

  UIState._();
  static Serializer<UIState> get serializer => _$uIStateSerializer;
}
