import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_states.freezed.dart';

@freezed
class AuthStates with _$AuthStates {
  const factory AuthStates.initial() = _AuthStatesInitial;
  const factory AuthStates.authenticated() = _AuthStatesAuthenticated;
  const factory AuthStates.unauthenticated() = _AuthStatesUnauthenticated;
}
