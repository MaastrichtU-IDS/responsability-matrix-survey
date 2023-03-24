import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'firebase_options.dart';
import 'repositories/questionnaire_repository.dart';
import 'repositories/questions_repository.dart';
import 'repositories/user_repository.dart';
import 'services/firebase/auth_state/auth_states.dart';
import 'services/firebase/auth_state/persistent_auth_controller.dart';
import 'services/graphql/graphql_service.dart';
import 'style/style_provider.dart';
import 'utils/instance_controller/instance_controller.dart';
import 'views/auth_gate/login/login_page.dart';
import 'views/auth_gate/register/register_page.dart';
import 'views/learn_more/learn_more_page.dart';
import 'views/root/root.dart';
import 'views/splash_view/splash_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final Logger logger = Logger();
  InstanceController().addInstance(Logger, logger);

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  final GraphQLService graphQLService = GraphQLService(
    // baseUrl: const String.fromEnvironment('GRAPHQL_URL',
    //     defaultValue: 'http://localhost:4000/graphql'),
    baseUrl: const String.fromEnvironment('GRAPHQL_URL',
        defaultValue: 'http://localhost:4000/graphql'),
    tokenProvider: () async {
      final String? token =
          await FirebaseAuth.instance.currentUser?.getIdToken();
      final ret = 'Bearer $token';
      return ret;
    },
  );
  await graphQLService.init();
  InstanceController().addInstance(GraphQLService, graphQLService);

  InstanceController().addInstance(QuestionsRepository, QuestionsRepository());

  final UserRepository userRepository = UserRepository();
  InstanceController().addInstance(UserRepository, userRepository);

  InstanceController()
      .addInstance(QuestionnaireRepository, QuestionnaireRepository());

  runApp(ProviderScope(child: StyleProvider(child: MyApp())));
}

final persistentAuthController =
    StateNotifierProvider<PersistentAuthController, AuthStates>(
        (ref) => PersistentAuthController());

class MyApp extends ConsumerWidget {
  MyApp({super.key});
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen<AuthStates>(persistentAuthController, (previous, next) {
      if (previous != next) {
        navigatorKey.currentState!
            .pushNamedAndRemoveUntil(SplashPage.routeName, (route) => false);
      }
    });
    return MaterialApp(
      navigatorKey: navigatorKey,
      title: 'UM Responsibility Matrix',
      theme: ThemeData(
          primarySwatch: createMaterialColor(
              StyleProvider.of(context).colors.appPrimaryColor)),
      initialRoute: SplashPage.routeName,
      onGenerateRoute: (settings) {
        Widget widget;
        switch (settings.name) {
          case SplashPage.routeName:
            widget = const SplashPage();
            break;
          case LearnMorePage.routeName:
            widget = const LearnMorePage();
            break;
          case LoginPage.routeName:
            widget = const LoginPage();
            break;
          case RegisterPage.routeName:
            widget = const RegisterPage();
            break;
          case RootPage.routeName:
            widget = const RootPage();
            break;
          default:
            widget = const SplashPage();
        }
        return MaterialPageRoute(builder: (context) => widget);
      },
    );
  }
}

// Create MaterialColor from color.
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
