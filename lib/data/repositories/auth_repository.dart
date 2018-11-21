import 'dart:async';
import 'dart:convert';
import 'dart:core';

import '../models/token_model.dart';
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

    // try {
    //   Map<String, dynamic> _response = json.decode(response);
    //   print("Response: $_response");
    //   // var _token = Token.fromJson(_response)?.access_token;
    //   // print("Token From JSON: $_token");
    //   // return _token;
      
    // } catch (e) {
    //   print(e);
    //   return null;
    // }

    return response['access_token'];

    // LoginResponse loginResponse =
    //     serializers.deserializeWith(LoginResponse.serializer, response);

    // return loginResponse.data.toBuiltList();
  }
}
