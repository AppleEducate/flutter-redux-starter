import 'dart:async';
import 'dart:convert';
import 'dart:core';

import '../web_client.dart';
import '../../constants.dart';

class AuthRepository {
  final WebClient webClient;

  const AuthRepository({
    this.webClient = const WebClient(),
  });

  Future<String> login(String email, String password) async {
    final credentials = {
      'grant_type': 'password',
      'username': email,
      'password': password,
    };

    var url = kApiUrl.replaceAll('api', 'token');

    final response = await webClient.post(
      url,
      credentials,
      bodyContentType: "application/x-www-form-urlencoded",
    );

    return response['access_token'];

    // LoginResponse loginResponse =
    //     serializers.deserializeWith(LoginResponse.serializer, response);

    // return loginResponse.data.toBuiltList();
  }
}
