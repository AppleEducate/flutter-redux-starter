import 'package:MyUnifyMobile/redux/ui/ui_actions.dart';
import 'package:MyUnifyMobile/redux/ui/ui_state.dart';
import 'package:redux/redux.dart';
// STARTER: import - do not remove comment
import 'package:MyUnifyMobile/redux/group/group_reducer.dart';

import 'package:MyUnifyMobile/redux/task/task_reducer.dart';

import 'package:MyUnifyMobile/redux/contact/contact_reducer.dart';

UIState uiReducer(UIState state, action) {
  return state.rebuild((b) => b
    ..currentRoute = currentRouteReducer(state.currentRoute, action)
    // STARTER: reducer - do not remove comment
    ..groupUIState.replace(groupUIReducer(state.groupUIState, action))
    ..taskUIState.replace(taskUIReducer(state.taskUIState, action))
    ..contactUIState.replace(contactUIReducer(state.contactUIState, action)));
}

Reducer<String> currentRouteReducer = combineReducers([
  TypedReducer<String, UpdateCurrentRoute>(updateCurrentRouteReducer),
]);

String updateCurrentRouteReducer(
    String currentRoute, UpdateCurrentRoute action) {
  return action.route;
}
