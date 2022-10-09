import '../models/user/user_model.dart';
import '../services/graphql/graphql_service.dart';
import '../services/graphql/mutations/create_user_mutation.dart';
import '../services/graphql/quaries/get_user_query.dart';
import '../utils/instance_controller/instance_controller.dart';

class UserRepository {
  final GraphQLService _graphQLService =
      InstanceController()[GraphQLService] as GraphQLService;

  UserModel? _user;

  UserModel? get user => _user;

  

  Future<UserModel?> getUser(String uuid) async {
    final response = await _graphQLService.query(
        const GetUserQuery(), GetUserQueryArgs(uuid: uuid));
    if (response.data != null) {
      final List<dynamic> users = response.data!['users'];
      if (users.isNotEmpty) {
        _user = UserModel.fromJson(users.first);
        return _user;
      }
    }
    return null;
  }

  Future<UserModel?> createUser(CreateUserMutationArgs args) async {
    final result =
        await _graphQLService.mutate(const CreateUserMutation(), args);
    if (result.hasException) {
      Future.error(result.exception!);
    }
    _user = await getUser(args.uuid);
    if (_user != null) {
      return _user;
    }
    return null;
  }

  void clearUser() {
    _user = null;
  }
}
