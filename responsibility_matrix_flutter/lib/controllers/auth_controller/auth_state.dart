import 'package:freezed_annotation/freezed_annotation.dart';
import '../../models/user/user_model.dart';

part 'auth_state.freezed.dart';

@freezed
class AuthState with _$AuthState {
  factory AuthState({
    required bool isAuthenticated,
    required bool isRegistered,
    required UserModel? user,
  }) = _AuthState;
}
