import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
// STARTER: import - do not remove comment
import 'package:MyUnifyMobile/redux/group/group_state.dart';

import 'package:MyUnifyMobile/redux/task/task_state.dart';

import 'package:MyUnifyMobile/redux/contact/contact_state.dart';

part 'data_state.g.dart';

abstract class DataState implements Built<DataState, DataStateBuilder> {
  // STARTER: fields - do not remove comment
  GroupState get groupState;

  TaskState get taskState;

  ContactState get contactState;

  factory DataState() {
    return _$DataState._(
      // STARTER: constructor - do not remove comment
      groupState: GroupState(),

      taskState: TaskState(),

      contactState: ContactState(),
    );
  }

  DataState._();
  static Serializer<DataState> get serializer => _$dataStateSerializer;
}
