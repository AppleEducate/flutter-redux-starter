import 'package:MyUnifyMobile/redux/app/data_state.dart';
// STARTER: import - do not remove comment
import 'package:MyUnifyMobile/redux/group/group_reducer.dart';

import 'package:MyUnifyMobile/redux/task/task_reducer.dart';

import 'package:MyUnifyMobile/redux/contact/contact_reducer.dart';

DataState dataReducer(DataState state, action) {
  return state.rebuild((b) => b
    // STARTER: reducer - do not remove comment
    ..groupState.replace(groupsReducer(state.groupState, action))
    ..taskState.replace(tasksReducer(state.taskState, action))
    ..contactState.replace(contactsReducer(state.contactState, action)));
}
