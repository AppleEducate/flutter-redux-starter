import 'dart:async';
import 'package:flutter/widgets.dart';
import 'package:built_collection/built_collection.dart';
import 'package:MyUnifyMobile/data/models/group_model.dart';
import 'package:MyUnifyMobile/redux/app/app_actions.dart';

class ViewGroupList implements PersistUI {
  final BuildContext context;
  ViewGroupList(this.context);
}

class ViewGroup implements PersistUI {
  final GroupEntity group;
  final BuildContext context;
  ViewGroup({this.group, this.context});
}

class EditGroup implements PersistUI {
  final GroupEntity group;
  final BuildContext context;
  EditGroup({this.group, this.context});
}

class LoadGroups {
  final Completer completer;
  final bool force;

  LoadGroups([this.completer, this.force = false]);
}

class LoadGroupsRequest implements StartLoading {}

class LoadGroupsFailure implements StopLoading {
  final dynamic error;
  LoadGroupsFailure(this.error);

  @override
  String toString() {
    return 'LoadGroupsFailure{error: $error}';
  }
}

class LoadGroupsSuccess implements StopLoading, PersistData {
  final BuiltList<GroupEntity> groups;
  LoadGroupsSuccess(this.groups);

  @override
  String toString() {
    return 'LoadGroupsSuccess{groups: $groups}';
  }
}

class UpdateGroup implements PersistUI {
  final GroupEntity group;
  UpdateGroup(this.group);
}

class SaveGroupRequest implements StartLoading {
  final Completer completer;
  final GroupEntity group;
  SaveGroupRequest({this.completer, this.group});
}

class AddGroupSuccess implements StopLoading, PersistData {
  final GroupEntity group;
  AddGroupSuccess(this.group);
}

class SaveGroupSuccess implements StopLoading, PersistData {
  final GroupEntity group;

  SaveGroupSuccess(this.group);
}

class SaveGroupFailure implements StopLoading {
  final String error;
  SaveGroupFailure(this.error);
}

class DeleteGroupRequest implements StartLoading {
  final Completer completer;
  final String groupId;

  DeleteGroupRequest(this.completer, this.groupId);
}

class DeleteGroupSuccess implements StopLoading, PersistData {
  final GroupEntity group;
  DeleteGroupSuccess(this.group);
}

class DeleteGroupFailure implements StopLoading {
  final GroupEntity group;
  DeleteGroupFailure(this.group);
}

class SearchGroups {
  final String search;
  SearchGroups(this.search);
}

class SortGroups implements PersistUI {
  final String field;
  SortGroups(this.field);
}
