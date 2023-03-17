import 'package:flutter/widgets.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:logger/logger.dart';
import 'package:responsibility_matrix_flutter/repositories/concrete/auth_repository/auth_repository.dart';
import 'package:responsibility_matrix_flutter/utils/instance_controller/instance_controller.dart';

class RestartApp {
  static final AuthRepository authRepository =
      InstanceController().getByType<AuthRepository>();

  static void restart(BuildContext context) {
    InstanceController().getByType<Logger>().i('Restarting app');
    authRepository.clearAll();
    Phoenix.rebirth(context);
  }
}
