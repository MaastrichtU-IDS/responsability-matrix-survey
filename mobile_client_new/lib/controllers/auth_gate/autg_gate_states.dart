import 'package:freezed_annotation/freezed_annotation.dart';

part 'autg_gate_states.freezed.dart';

@freezed
class AuthGateStates with _$AuthGateStates {
  const factory AuthGateStates.initial() = _AuthGateInitial;
  const factory AuthGateStates.loading() = _AuthGateLoading;
  const factory AuthGateStates.error(String error) = _AuthGateError;
  const factory AuthGateStates.toSplash() = _AuthGateToSplash;
}
