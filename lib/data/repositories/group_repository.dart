import 'dart:async';
import 'dart:core';
import 'dart:convert';
import 'package:built_collection/built_collection.dart';
import 'package:MyUnifyMobile/data/models/models.dart';
import 'package:MyUnifyMobile/data/models/serializers.dart';
import 'package:MyUnifyMobile/redux/auth/auth_state.dart';
import 'package:MyUnifyMobile/data/models/group_model.dart';
import 'package:MyUnifyMobile/data/web_client.dart';
import 'package:MyUnifyMobile/constants.dart';

class GroupRepository {
  final WebClient webClient;

  const GroupRepository({
    this.webClient = const WebClient(),
  });

  Future<BuiltList<GroupEntity>> loadList(AuthState auth) async {
    final response = await webClient.get(
      kApiUrl + '/contacts/info/contact_groups',
      token: auth?.token,
    );

    if (response.toString().contains("No Contact Groups Found")) {
      return new BuiltList<GroupEntity>();
    }

    var list = new BuiltList<GroupEntity>(response.map((group) {
      return serializers.deserializeWith(GroupEntity.serializer, group);
    }));

    return list;
  }

  Future saveData(AuthState auth, GroupEntity group,
      [EntityAction action]) async {
    var data = serializers.serializeWith(GroupEntity.serializer, group);
    var response;

    if (group.isNew) {
      response = await webClient.post(
        kApiUrl + '/groups/new',
        json.encode(data),
        token: auth?.token,
      );
    } else {
      var url = kApiUrl + '/groups/info/' + group.id.toString();
      response = await webClient.put(
        url,
        json.encode(data),
        token: auth?.token,
      );
    }

    return serializers.deserializeWith(GroupEntity.serializer, response);
  }
}
