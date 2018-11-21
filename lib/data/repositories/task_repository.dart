import 'dart:async';
import 'dart:core';
import 'dart:convert';
import 'package:built_collection/built_collection.dart';
import 'package:MyUnifyMobile/data/models/models.dart';
import 'package:MyUnifyMobile/data/models/serializers.dart';
import 'package:MyUnifyMobile/redux/auth/auth_state.dart';
import 'package:MyUnifyMobile/data/models/task_model.dart';
import 'package:MyUnifyMobile/data/web_client.dart';
import 'package:MyUnifyMobile/constants.dart';

class TaskRepository {
  final WebClient webClient;

  const TaskRepository({
    this.webClient = const WebClient(),
  });

  Future<BuiltList<TaskEntity>> loadList(AuthState auth, String date) async {
    final response =
        await webClient.get(kApiUrl + '/calendar/$date', token: auth?.token);
    print("Loaded Tasks $date => $response");

    if (response.toString().contains("No Tasks Found")) {
      print("No Tasks => $response");
      var _list = BuiltList<TaskEntity>([]);
      return _list;
    }

    var list = new BuiltList<TaskEntity>(
      response.map((task) {
        return serializers.deserializeWith(TaskEntity.serializer, task);
      }),
    );

    return list;
  }

  Future saveData(AuthState auth, TaskEntity task,
      [EntityAction action]) async {
    var data = serializers.serializeWith(TaskEntity.serializer, task);
    var response;

    if (task.isNew) {
      response =
          await webClient.post(kApiUrl + '/calendar/new', json.encode(data));
    } else {
      var url = kApiUrl + '/calendar/info/' + task.id.toString();
      response =
          await webClient.put(url, json.encode(data), token: auth?.token);
    }

    return serializers.deserializeWith(TaskEntity.serializer, response);
  }
}
