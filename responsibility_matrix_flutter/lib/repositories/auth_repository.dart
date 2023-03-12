import 'package:graphql/client.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../services/graphql/queries/get_jwt_query.dart';
import '../utils/instance_controller/instance_controller.dart';

class AuthRepository {
  AuthRepository({String? code = null}) : _code = code;

  String? _code;
  String? _uuid;
  String? _token;
  String? _userName;
  final String _baseUrl = const String.fromEnvironment('GRAPHQL_URL',
      defaultValue: 'http://localhost:4000/graphql');

  final String _authUrl = const String.fromEnvironment('AUTH_URL',
      defaultValue:
          'https://orcid.org/oauth/authorize?client_id=APP-YJFAMCMI8NXB9AAW&response_type=code&scope=openid&redirect_uri=https://developers.google.com/oauthplayground');

  String get authUrl => _authUrl;

  Logger logger = InstanceController()[Logger];

  set code(String? code) => _code = code;

  String? get uuid => _uuid;

  String? get token => _token;

  String? get userName => _userName;

  void clearCode() => _code = null;

  void clearToken() => _token = null;

  void clearUuid() => _uuid = null;

  void clearUserName() => _userName = null;

  bool get isCodePresent => _code != null;

  bool get isTokenPresent =>
      _token != null &&
      _token!.isNotEmpty &&
      _uuid != null &&
      _uuid!.isNotEmpty;

  Future<void> getFromStorage() async {
    final SharedPreferences sharedPreferences =
        InstanceController()[SharedPreferences];

    final token = await sharedPreferences.getString('token');

    final uuid = await sharedPreferences.getString('uuid');

    final userName = await sharedPreferences.getString('userName');

    if (token != null && token.isNotEmpty) {
      _token = token;
    }

    if (uuid != null && uuid.isNotEmpty) {
      _uuid = uuid;
    }

    if (userName != null && userName.isNotEmpty) {
      _userName = userName;
    }
  }

  Future<String> getAccessToken() async {
    if (_token != null) {
      logger.d('Token is not null');
      return _token!;
    }

    if (_code == null) {
      logger.e('Code is null');
      return '';
    }

    final client = GraphQLClient(
        link: HttpLink(_baseUrl), cache: GraphQLCache(store: InMemoryStore()));

    final query = const GetJWTQuery()
        .createQueryOptions(args: GetJWTQueryArgs(code: _code!));

    final response = await client.query(query);

    if (response.hasException) {
      logger.e(response.exception);
      throw response.exception ?? Exception('Unknown error');
    }

    final data = response.data!['getJWT']! as Map<String, dynamic>;

    final token = data['id_token']! as String;

    final uuid = data['orcid']! as String;

    final userName = data['name']! as String;

    // Code can be used only once

    clearCode();

    _token = 'Bearer $token';

    _uuid = uuid;

    _userName = userName;

    final SharedPreferences sharedPreferences =
        InstanceController()[SharedPreferences];

    sharedPreferences.setString('token', _token!);

    sharedPreferences.setString('uuid', _uuid!);

    sharedPreferences.setString('userName', _userName!);

    return _token!;
  }

  void clearAll() {
    clearCode();
    clearToken();
    clearUuid();
    clearUserName();

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
  }
}
