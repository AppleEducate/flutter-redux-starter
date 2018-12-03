import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:built_collection/built_collection.dart';
import 'package:MyUnifyMobile/constants.dart';
import 'package:MyUnifyMobile/data/models/group_model.dart';
import 'package:MyUnifyMobile/redux/ui/entity_ui_state.dart';
import 'package:MyUnifyMobile/redux/ui/list_ui_state.dart';

part 'group_state.g.dart';

abstract class GroupState implements Built<GroupState, GroupStateBuilder> {
  @nullable
  int get lastUpdated;

  BuiltMap<String, GroupEntity> get map;
  BuiltList<String> get list;

  factory GroupState() {
    return _$GroupState._(
      map: BuiltMap<String, GroupEntity>(),
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

  GroupState._();
  static Serializer<GroupState> get serializer => _$groupStateSerializer;
}

abstract class GroupUIState extends Object
    with EntityUIState
    implements Built<GroupUIState, GroupUIStateBuilder> {
  @nullable
  GroupEntity get selected;

  bool get isSelectedNew => selected.isNew;

  factory GroupUIState() {
    return _$GroupUIState._(
      listUIState: ListUIState('', 'All'),
      selected: GroupEntity(),
    );
  }

  GroupUIState._();
  static Serializer<GroupUIState> get serializer => _$groupUIStateSerializer;
}
