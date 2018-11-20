import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:MyUnifyMobile/data/models/models.dart';

part 'task_model.g.dart';

class TaskFields {
  // STARTER: fields - do not remove comment
  static const String Lead_Task_Type = 'Lead_Task_Type';

  static const String Lead_Task_Title = 'Lead_Task_Title';

  static const String Lead_Task_Description = 'Lead_Task_Description';

  static const String Lead_Task_Time = 'Lead_Task_Time';

  static const String Alert_Time_Offset = 'Alert_Time_Offset';

  static const String Lead_Task_Status = 'Lead_Task_Status';

  static const String Lead_ID = 'Lead_ID';

  static const String Contact_ID = 'Contact_ID';

  static const String Core_Lead_ID = 'Core_Lead_ID';
}

abstract class TaskEntity extends Object
    with BaseEntity
    implements Built<TaskEntity, TaskEntityBuilder> {
  // STARTER: properties - do not remove comment
  String get Lead_Task_Type;

  String get Lead_Task_Title;

  String get Lead_Task_Description;

  String get Lead_Task_Time;

  String get Alert_Time_Offset;

  String get Lead_Task_Status;

  String get Lead_ID;

  String get Contact_ID;

  String get Core_Lead_ID;

  static int counter = 0;
  factory TaskEntity() {
    return _$TaskEntity._(
      id: '',
      // STARTER: constructor - do not remove comment
      Lead_Task_Type: '',

      Lead_Task_Title: '',

      Lead_Task_Description: '',

      Lead_Task_Time: '',

      Alert_Time_Offset: '',

      Lead_Task_Status: '',

      Lead_ID: '',

      Contact_ID: '',

      Core_Lead_ID: '',
    );
  }

  String get displayName {
    // STARTER: display name - do not remove comment
    return Lead_Task_Type;
  }

  int compareTo(TaskEntity task, String sortField, bool sortAscending) {
    int response = 0;
    TaskEntity taskA = sortAscending ? this : task;
    TaskEntity taskB = sortAscending ? task : this;

    switch (sortField) {
      // STARTER: sort switch - do not remove comment
      case TaskFields.Lead_Task_Type:
        response = taskA.Lead_Task_Type.compareTo(taskB.Lead_Task_Type);
        break;

      case TaskFields.Lead_Task_Title:
        response = taskA.Lead_Task_Title.compareTo(taskB.Lead_Task_Title);
        break;

      case TaskFields.Lead_Task_Description:
        response =
            taskA.Lead_Task_Description.compareTo(taskB.Lead_Task_Description);
        break;

      case TaskFields.Lead_Task_Time:
        response = taskA.Lead_Task_Time.compareTo(taskB.Lead_Task_Time);
        break;

      case TaskFields.Alert_Time_Offset:
        response = taskA.Alert_Time_Offset.compareTo(taskB.Alert_Time_Offset);
        break;

      case TaskFields.Lead_Task_Status:
        response = taskA.Lead_Task_Status.compareTo(taskB.Lead_Task_Status);
        break;

      case TaskFields.Lead_ID:
        response = taskA.Lead_ID.compareTo(taskB.Lead_ID);
        break;

      case TaskFields.Contact_ID:
        response = taskA.Contact_ID.compareTo(taskB.Contact_ID);
        break;

      case TaskFields.Core_Lead_ID:
        response = taskA.Core_Lead_ID.compareTo(taskB.Core_Lead_ID);
        break;
    }

    if (response == 0) {
      // STARTER: sort default - do not remove comment
      return taskA.Lead_Task_Type.compareTo(taskB.Lead_Task_Type);
    } else {
      return response;
    }
  }

  bool matchesSearch(String search) {
    if (search == null || search.isEmpty) {
      return true;
    }

    search = search.toLowerCase();

    // STARTER: search - do not remove comment
    if (Lead_Task_Type.toLowerCase().contains(search)) {
      return true;
    }

    if (Lead_Task_Title.toLowerCase().contains(search)) {
      return true;
    }

    if (Lead_Task_Description.toLowerCase().contains(search)) {
      return true;
    }

    if (Lead_Task_Time.toLowerCase().contains(search)) {
      return true;
    }

    if (Alert_Time_Offset.toLowerCase().contains(search)) {
      return true;
    }

    if (Lead_Task_Status.toLowerCase().contains(search)) {
      return true;
    }

    if (Lead_ID.toLowerCase().contains(search)) {
      return true;
    }

    if (Contact_ID.toLowerCase().contains(search)) {
      return true;
    }

    if (Core_Lead_ID.toLowerCase().contains(search)) {
      return true;
    }

    return false;
  }

  TaskEntity._();
  static Serializer<TaskEntity> get serializer => _$taskEntitySerializer;
}
