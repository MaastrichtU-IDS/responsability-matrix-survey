import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

/*

# User Schema

type User {
    email: String!
    username: String!
    registered_at: Date!
    role: String!
}


*/

@freezed
class UserModel with _$UserModel {
  factory UserModel({
    required String uuid,
    required String email,
    required String username,
    required String role,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}
