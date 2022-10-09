import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../controllers/nav_bar_loading_controller/nav_bar_loading_controller.dart';
import '../../models/questionnaire/questionnaire_model.dart';
import '../dahsboard/dashboard.dart';
import '../home/home_page.dart';
import '../question/question_page.dart';
import 'add_quetionnarie_dialog.dart';
import '../../widgets/navbar/nav_bar_controller.dart';
import '../../widgets/navbar/navbar.dart';
import '../../widgets/navbar/navbar_item.dart';
import '../../widgets/uni_logo.dart';

final rootLoading = StateNotifierProvider<NavBarLoadingController, bool>(
  (ref) {
    return NavBarLoadingController();
  },
);

final navController = StateNotifierProvider<NavBarController, String>((ref) {
  return NavBarController(initalRoute: "home");
});

class RootPage extends ConsumerStatefulWidget {
  const RootPage({Key? key}) : super(key: key);

  static const String routeName = 'root';

  @override
  ConsumerState<RootPage> createState() => _RootPageState();
}

class _RootPageState extends ConsumerState<RootPage>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    ref.read(navController.originProvider).addRouteGuard((route) {
      if (route != "home" &&
          ref
                  .read(questionnaireController.originProvider)
                  .selectedQuestionnaire ==
              null) {
        return "Please select a questionnaire";
      }
      return null;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final questionnairesState = ref.watch(questionnaireController);
    final state = ref.watch(navController);
    return Scaffold(
      body: Column(
        children: [
          Navbar(
            navController: navController,
            leftItems: [
              const UniLogo(width: 30, height: 50),
              const SizedBox(width: 10),
              NavbarItem(
                key: const Key("Home-nav"),
                route: HomePage.routeName,
                isSelected: state == HomePage.routeName,
                title: "Home",
              ),
              ...questionnairesState.maybeMap(
                  initial: (value) => [],
                  orElse: () => [
                        NavbarItem(
                          key: const Key("questions-nav"),
                          route: QuestionPage.routeName,
                          isSelected: state == QuestionPage.routeName,
                          title: "Questions",
                        ),
                        NavbarItem(
                          key: const Key("dashboard-nav"),
                          route: DashboardPage.routeName,
                          isSelected: state == DashboardPage.routeName,
                          title: "Dashboard",
                        ),
                      ])
            ],
            rightItems: [
              Text(
                  "Selected Questionnaire: ${ref.watch(questionnaireController.originProvider).selectedQuestionnaire?.title ?? "None"}",
                  style: Theme.of(context).textTheme.headline6),
              const SizedBox(width: 16),
              ElevatedButton.icon(
                  onPressed: () async {
                    await showDialog<QuestionnaireModel>(
                        context: context,
                        builder: (context) => const AddQuestionnarieDialog());
                  },
                  icon: const Icon(Icons.add),
                  label: const Text("Add Questionnaire")),
              const SizedBox(width: 20),
              ElevatedButton.icon(
                  onPressed: () {
                    FirebaseAuth.instance.signOut();
                  },
                  icon: const Icon(Icons.logout),
                  label: const Text("Logout")),
            ],
          ),
          if (ref.watch(rootLoading))
            const LinearProgressIndicator(
              backgroundColor: Colors.transparent,
            ),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Navigator(
              key: ref.watch(navController.originProvider).navigatorKey,
              initialRoute: HomePage.routeName,
              onGenerateRoute: (settings) {
                late Widget page;
                switch (settings.name) {
                  case HomePage.routeName:
                    page = HomePage();
                    break;
                  case QuestionPage.routeName:
                    page = const QuestionPage();
                    break;
                  case DashboardPage.routeName:
                    page = const DashboardPage();
                    break;
                  default:
                    page = HomePage();
                    break;
                }
                return PageRouteBuilder(
                    transitionDuration: const Duration(milliseconds: 0),
                    pageBuilder: (context, animation, secondaryAnimation) =>
                        page,
                    transitionsBuilder:
                        (context, animation, secondaryAnimation, child) {
                      return Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal:
                                MediaQuery.of(context).size.width * 0.05),
                        child: child,
                      );
                    });
              },
            ),
          )),
        ],
      ),
    );
  }
}
