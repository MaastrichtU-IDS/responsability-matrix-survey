
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_data.freezed.dart';


@freezed
class AuthData with _$AuthData {
  factory AuthData(
    {
      required String? token,
      required String? code,
      required String? uuid,
      required String? userName,
    }
  ) = _AuthData;
	
}
