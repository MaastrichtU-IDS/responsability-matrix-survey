
import 'package:freezed_annotation/freezed_annotation.dart';

part 'splash_controller_states.freezed.dart';


@freezed
class SplashControllerStates with _$SplashControllerStates {
  const factory SplashControllerStates.initial() = _SplashControllerStatesInitial;
  const factory SplashControllerStates.authenticated() = _SplashControllerStatesAuthenticated;
  const factory SplashControllerStates.authenticatedNotRegistered() = _SplashControllerStatesAuthenticatedNotRegistered;
  const factory SplashControllerStates.unauthenticated() = _SplashControllerStatesUnauthenticated;
}
