import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:MyUnifyMobile/ui/home/home_screen.dart';
// STARTER: import - do not remove comment
import 'package:MyUnifyMobile/redux/contact/contact_state.dart';


part 'ui_state.g.dart';

abstract class UIState implements Built<UIState, UIStateBuilder> {
  String get currentRoute;

  // STARTER: properties - do not remove comment
ContactUIState get contactUIState;


  factory UIState() {
    return _$UIState._(
      //currentRoute: LoginScreen.route,
      currentRoute: HomeScreen.route,
      // STARTER: constructor - do not remove comment
contactUIState: ContactUIState(),

    );
  }

  UIState._();
  static Serializer<UIState> get serializer => _$uIStateSerializer;
}
