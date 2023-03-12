part of '../shell_page.dart';

final routeTitles = {
  'home': 'Home',
  'questions': 'Questions',
  'dashboard': 'Dashboard',
};

class _ShellPageSmall extends ConsumerWidget {
  const _ShellPageSmall({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final routeState = ref.watch(shellProvider);
    final projectState = ref.watch(projectProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text(routeTitles[routeState] ?? 'home').tr(),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () async {
              final result = await showDialog<Map<String, String>?>(
                  context: context,
                  builder: (context) => const AddQuestionnaireDialog());

              if (result != null) {
                ref
                    .read(projectProvider.notifier)
                    .addQuestionnaire(result['title']!, result['description']!);
              }
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            const DrawerHeader(
              child: UniLogo(),
            ),
            for (final item in rightItemsAlways)
              ListTile(
                key: Key('${item.route}-nav'),
                selected: routeState == item.route,
                title: Text(item.title).tr(),
                onTap: () {
                  ref.read(shellProvider.notifier).navigateTo(item.route);
                },
              ),
            if (projectState.questionnaire != null) ...[
              for (final item in rightItemsWhenProjectSelected)
                ListTile(
                  key: Key('${item.route}-nav'),
                  selected: routeState == item.route,
                  title: Text(item.title).tr(),
                  onTap: () {
                    ref.read(shellProvider.notifier).navigateTo(item.route);
                  },
                ),
            ],
            ListTile(
              title: const Text('logout').tr(),
              onTap: () {
                ref.read(authProvider.notifier).logout();
                context.go('/login');
              },
            ),
          ],
        ),
      ),
      body: Column(children: [
        if (ref.watch(loadingProvider))
          const LinearProgressIndicator(
            backgroundColor: Colors.transparent,
          ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: child,
          ),
        ),
      ]),
    );
  }
}
