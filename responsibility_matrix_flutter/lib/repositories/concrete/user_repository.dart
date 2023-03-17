import 'package:responsibility_matrix_flutter/repositories/interfaces/repository_i.dart';
import 'package:responsibility_matrix_flutter/repositories/models/repository_response_model.dart';

import '../../models/user/user_model.dart';
import '../../services/graphql/graphql_service.dart';
import '../../services/graphql/mutations/create_user_mutation.dart';
import '../../services/graphql/queries/get_user_query.dart';
import '../../utils/instance_controller/instance_controller.dart';

class UserRepository extends IRepository {
  final GraphQLService _graphQLService =
      InstanceController()[GraphQLService] as GraphQLService;

  UserModel? _user;

  UserModel? get user => _user;

  Future<RepositoryResponseModel<UserModel>> getUser(String uuid) async {
    final response = await _graphQLService.query(
        const GetUserQuery(), GetUserQueryArgs(uuid: uuid));
    if (response.data != null) {
      final List<dynamic> users = response.data!['users'];
      if (users.isNotEmpty) {
        _user = UserModel.fromJson(users.first);
        return RepositoryResponseModel<UserModel>.data(_user!);
      }
    }
    return RepositoryResponseModel.empty();
  }

  Future<RepositoryResponseModel<UserModel>> createUser(
      CreateUserMutationArgs args) async {
    final result =
        await _graphQLService.mutate(const CreateUserMutation(), args);
    if (result.hasError) {
      return RepositoryResponseModel<UserModel>.error(
          onError(UserRepository, result.error!.message));
    }
    final _user = await getUser(args.uuid);
    if (_user.hasData) {
      return _user;
    }
    return RepositoryResponseModel<UserModel>.error(
        onError(UserRepository, _user.error!.message));
  }

  void clearUser() {
    _user = null;
  }
}
