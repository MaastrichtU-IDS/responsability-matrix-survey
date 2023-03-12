import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'repositories/auth_repository.dart';
import 'repositories/questionnaire_repository.dart';
import 'repositories/questions_repository.dart';
import 'repositories/user_repository.dart';
import 'router.dart';
import 'services/graphql/graphql_service.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'services/snackbar_service/snackbar_service.dart';
import 'utils/instance_controller/instance_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  usePathUrlStrategy();
  final code = Uri.base.queryParameters['code'];

  InstanceController().addInstance(Logger, Logger());

  final sharedPreferences = await SharedPreferences.getInstance();

  InstanceController().addInstance(SharedPreferences, sharedPreferences);

  InstanceController().addInstance(SnackBarService, SnackBarService());

  InstanceController().addInstance(AuthRepository, AuthRepository(code: code));

  await InstanceController().getByType<AuthRepository>().getFromStorage();

  InstanceController().addInstance(
      GraphQLService,
      GraphQLService(
        baseUrl: const String.fromEnvironment('GRAPHQL_URL',
            defaultValue: 'http://localhost:4000/graphql'),
        tokenProvider: () =>
            InstanceController().getByType<AuthRepository>().getAccessToken(),
      ));
  InstanceController().addInstance(UserRepository, UserRepository());
  InstanceController().addInstance(QuestionsRepository, QuestionsRepository());
  InstanceController()
      .addInstance(QuestionnaireRepository, QuestionnaireRepository());

  runApp(ProviderScope(
      child: EasyLocalization(
          path: 'assets/lang',
          fallbackLocale: const Locale('en', 'US'),
          supportedLocales: const [Locale('en', 'US')],
          child: const App())));
}

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      scaffoldMessengerKey: InstanceController()
          .getByType<SnackBarService>()
          .scaffoldMessengerKey,
      routerConfig: router,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      title: 'Responsibility Matrix',
      theme: ThemeData(
          primarySwatch:
              createMaterialColor(const Color.fromRGBO(0, 21, 58, 1))),
    );
  }
}

MaterialColor createMaterialColor(Color color) {
  final List strengths = <double>[.05];
  final Map<int, Color> swatch = {};
  final int r = color.red, g = color.green, b = color.blue;

  for (int i = 1; i < 10; i++) {
    strengths.add(0.1 * i);
  }
  for (final strength in strengths) {
    final double ds = 0.5 - strength;
    swatch[(strength * 1000).round()] = Color.fromRGBO(
      r + ((ds < 0 ? r : (255 - r)) * ds).round(),
      g + ((ds < 0 ? g : (255 - g)) * ds).round(),
      b + ((ds < 0 ? b : (255 - b)) * ds).round(),
      1,
    );
  }
  return MaterialColor(color.value, swatch);
}