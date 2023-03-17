import 'dart:async';

import 'package:graphql/client.dart';
import 'package:logger/logger.dart';
import 'package:responsibility_matrix_flutter/repositories/models/repository_error_model.dart';
import 'package:responsibility_matrix_flutter/services/error_bucket/error_bucket.dart';
import 'package:shared_preferences/shared_preferences.dart';

import './auth_data.dart';
import '../../../services/graphql/queries/get_jwt_query.dart';
import '../../../utils/instance_controller/instance_controller.dart';

class AuthRepository {
  AuthRepository({String? code = null}) {
    _authData = _authData.copyWith(code: code);
    ErrorBucket().registerErrorType<AuthRepository, RepositoryErrorModel>();
  }

  AuthData _authData = AuthData(
    code: null,
    token: null,
    uuid: null,
    userName: null,
  );

  StreamController<bool> isAuthenticatedStreamController =
      StreamController<bool>.broadcast();

  final String _baseUrl = const String.fromEnvironment('GRAPHQL_URL',
      defaultValue: 'http://localhost:4000/graphql');

  final String _authUrl = const String.fromEnvironment('AUTH_URL',
      defaultValue:
          'https://orcid.org/oauth/authorize?client_id=APP-YJFAMCMI8NXB9AAW&response_type=code&scope=openid&redirect_uri=https://developers.google.com/oauthplayground');

  String get authUrl => _authUrl;

  Logger logger = InstanceController()[Logger];

  set code(String? code) => _authData = _authData.copyWith(code: code);

  String? get uuid => _authData.uuid;

  String? get token => _authData.token;

  String? get userName => _authData.userName;

  void clearCode() => _authData = _authData.copyWith(code: null);

  void clearToken() => _authData = _authData.copyWith(token: null);

  void clearUuid() => _authData = _authData.copyWith(uuid: null);

  void clearUserName() => _authData = _authData.copyWith(userName: null);

  bool get isCodePresent =>
      _authData.code != null && _authData.code!.isNotEmpty;

  bool get isTokenPresent =>
      _authData.token != null &&
      _authData.token!.isNotEmpty &&
      _authData.uuid != null &&
      _authData.uuid!.isNotEmpty &&
      _authData.userName != null &&
      _authData.userName!.isNotEmpty;

  Future<void> getFromStorage() async {
    final SharedPreferences sharedPreferences =
        InstanceController()[SharedPreferences];

    final token = await sharedPreferences.getString('token');

    final uuid = await sharedPreferences.getString('uuid');

    final userName = await sharedPreferences.getString('userName');

    if (token != null && token.isNotEmpty) {
      _authData = _authData.copyWith(token: token);
    }

    if (uuid != null && uuid.isNotEmpty) {
      _authData = _authData.copyWith(uuid: uuid);
    }

    if (userName != null && userName.isNotEmpty) {
      _authData = _authData.copyWith(userName: userName);
    }
  }

  Future<String> getAccessToken() async {
    if (_authData.token != null) {
      logger.d('Token is not null');
      return _authData.token!;
    }

    if (_authData.code == null) {
      logger.e('Code is null');
      return '';
    }

    final client = GraphQLClient(
        link: HttpLink(_baseUrl), cache: GraphQLCache(store: InMemoryStore()));

    final query = const GetJWTQuery()
        .createQueryOptions(args: GetJWTQueryArgs(code: _authData.code!));

    final response = await client.query(query);

    if (response.hasException || response.data!['getJWT']['error'] != null) {
      logger.e('AuthRepository: getAccessToken: ${response.exception}');
      ErrorBucket().addError<RepositoryErrorModel>(RepositoryErrorModel(
        AuthRepository,
        response.data!['getJWT']['error'],
      ));
      return '';
    }

    final data = response.data!['getJWT']! as Map<String, dynamic>;

    final token = data['id_token']! as String;

    final uuid = data['orcid']! as String;

    final userName = data['name']! as String;

    // Code can be used only once

    clearCode();

    _authData = _authData.copyWith(
        token: 'Bearer $token', uuid: uuid, userName: userName);

    final SharedPreferences sharedPreferences =
        InstanceController()[SharedPreferences];

    sharedPreferences.setString('token', 'Bearer $token');

    sharedPreferences.setString('uuid', _authData.uuid!);

    sharedPreferences.setString('userName', _authData.userName!);

    if (isAuthenticatedStreamController.stream.last == false) {
      isAuthenticatedStreamController.add(true);
    }

    return _authData.token!;
  }

  void clearAll() {
    _authData = AuthData(
      code: null,
      token: null,
      uuid: null,
      userName: null,
    );

    final SharedPreferences sharedPreferences =
        InstanceController()[SharedPreferences];

    if (sharedPreferences.containsKey('token')) {
      sharedPreferences.remove('token');
    }

    if (sharedPreferences.containsKey('uuid')) {
      sharedPreferences.remove('uuid');
    }

    if (sharedPreferences.containsKey('userName')) {
      sharedPreferences.remove('userName');
    }

    if (isAuthenticatedStreamController.stream.last == true) {
      isAuthenticatedStreamController.add(false);
    }
  }
}
