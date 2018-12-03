import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:built_collection/built_collection.dart';
import 'package:MyUnifyMobile/constants.dart';
import 'package:MyUnifyMobile/data/models/task_model.dart';
import 'package:MyUnifyMobile/redux/ui/entity_ui_state.dart';
import 'package:MyUnifyMobile/redux/ui/list_ui_state.dart';

part 'task_state.g.dart';

abstract class TaskState implements Built<TaskState, TaskStateBuilder> {
  @nullable
  int get lastUpdated;

  BuiltMap<String, TaskEntity> get map;
  BuiltList<String> get list;

  factory TaskState() {
    return _$TaskState._(
      map: BuiltMap<String, TaskEntity>(),
      list: BuiltList<String>(),
    );
  }

  bool get isStale {
    if (!isLoaded) {
      return true;
    }

    return DateTime.now().millisecondsSinceEpoch - lastUpdated >
        kMillisecondsToRefreshData;
  }

  bool get isLoaded {
    return lastUpdated != null;
  }

  TaskState._();
  static Serializer<TaskState> get serializer => _$taskStateSerializer;
}

abstract class TaskUIState extends Object
    with EntityUIState
    implements Built<TaskUIState, TaskUIStateBuilder> {
  @nullable
  TaskEntity get selected;

  bool get isSelectedNew => selected.isNew;

  factory TaskUIState() {
    return _$TaskUIState._(
      listUIState: ListUIState('', 'All'),
      selected: TaskEntity(),
    );
  }

  TaskUIState._();
  static Serializer<TaskUIState> get serializer => _$taskUIStateSerializer;
}
