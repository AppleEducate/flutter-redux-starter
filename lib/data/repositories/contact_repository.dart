import 'dart:async';
import 'dart:core';
import 'dart:convert';
import 'package:built_collection/built_collection.dart';
import 'package:MyUnifyMobile/data/models/models.dart';
import 'package:MyUnifyMobile/data/models/serializers.dart';
import 'package:MyUnifyMobile/redux/auth/auth_state.dart';
import 'package:MyUnifyMobile/data/models/contact_model.dart';
import 'package:MyUnifyMobile/data/web_client.dart';
import 'package:MyUnifyMobile/constants.dart';
import '../models/paging_model.dart';
import 'package:flutter/foundation.dart';

class ContactRepository {
  final WebClient webClient;

  const ContactRepository({
    this.webClient = const WebClient(),
  });

  Future<BuiltList<ContactEntity>> loadList(AuthState auth,
      {@required PagingModel paging}) async {
    final response = await webClient.get(
      kApiUrl + '/contacts/${paging.rows}/${paging.page}',
      token: auth?.token,
    );

    if (response.toString().contains("No Contacts Found")) {
      return new BuiltList<ContactEntity>();
    }

    var list = new BuiltList<ContactEntity>(response.map((contact) {
      return serializers.deserializeWith(ContactEntity.serializer, contact);
    }));

    return list;
  }

  Future deleteContact(AuthState auth, String id) async {
    var url = kApiUrl + '/contacts/info/' + id.toString();
    var response;
    response = await webClient.delete(url, token: auth?.token);
    print(response);
  }

  Future saveData(AuthState auth, ContactEntity contact) async {
    var data = serializers.serializeWith(ContactEntity.serializer, contact);
    var response;

    if (contact.isNew) {
      response =
          await webClient.post(kApiUrl + '/contacts/new', json.encode(data));
    } else {
      var url = kApiUrl + '/contacts/info/' + contact.id.toString();
      response =
          await webClient.put(url, json.encode(data), token: auth?.token);
    }

    return serializers.deserializeWith(ContactEntity.serializer, response);
  }
}
