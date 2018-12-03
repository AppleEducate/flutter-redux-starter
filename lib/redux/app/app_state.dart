import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:MyUnifyMobile/data/models/models.dart';
import 'package:MyUnifyMobile/redux/app/data_state.dart';
import 'package:MyUnifyMobile/redux/auth/auth_state.dart';
import 'package:MyUnifyMobile/redux/ui/entity_ui_state.dart';
import 'package:MyUnifyMobile/redux/ui/list_ui_state.dart';
import 'package:MyUnifyMobile/redux/ui/ui_state.dart';
// STARTER: import - do not remove comment
import 'package:MyUnifyMobile/redux/group/group_state.dart';

import 'package:MyUnifyMobile/redux/task/task_state.dart';

import 'package:MyUnifyMobile/redux/contact/contact_state.dart';
import '../../utils/date_formatter.dart';

part 'app_state.g.dart';

abstract class AppState implements Built<AppState, AppStateBuilder> {
  bool get isLoading;
  AuthState get authState;
  UIState get uiState;
  DataState get dataState;
  String get tasksDate;

  factory AppState() {
    return _$AppState._(
      isLoading: false,
      authState: AuthState(),
      uiState: UIState(),
      dataState: DataState(),
      tasksDate: formatDateCustom(DateTime.now()),
    );
  }

  AppState._();
  static Serializer<AppState> get serializer => _$appStateSerializer;

  EntityUIState getUIState(EntityType type) {
    switch (type) {
      // STARTER: states switch - do not remove comment
      case EntityType.group:
        return groupUIState;

      case EntityType.task:
        return taskUIState;

      case EntityType.contact:
        return contactUIState;

      default:
        return null;
    }
  }

  ListUIState getListState(EntityType type) {
    return getUIState(type).listUIState;
  }

  // STARTER: state getters - do not remove comment
  GroupState get groupState => this.dataState.groupState;
  ListUIState get groupListState => this.uiState.groupUIState.listUIState;
  GroupUIState get groupUIState => this.uiState.groupUIState;

  TaskState get taskState => this.dataState.taskState;
  ListUIState get taskListState => this.uiState.taskUIState.listUIState;
  TaskUIState get taskUIState => this.uiState.taskUIState;

  ContactState get contactState => this.dataState.contactState;
  ListUIState get contactListState => this.uiState.contactUIState.listUIState;
  ContactUIState get contactUIState => this.uiState.contactUIState;

  /*
  @override
  String toString() {
    return 'Is Loading: ${this.isLoading}';
  }
  */
}
