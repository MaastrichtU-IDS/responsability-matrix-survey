part of '../shell_page.dart';

class _ShellPageLarge extends ConsumerWidget {
  const _ShellPageLarge({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final routeState = ref.watch(shellProvider);
    final projectState = ref.watch(projectProvider);
    return Scaffold(
      body: Column(
        children: [
          Navbar(
            leftItems: [
              const UniLogo(height: 50),
              const SizedBox(width: 10),
              for (final item in rightItemsAlways)
                _NavbarItem(
                  key: Key('${item.route}-nav'),
                  routeNamed: item.route,
                  isSelected: routeState == item.route,
                  title: item.title,
                ),
              if (projectState.questionnaire != null) ...[
                for (final item in rightItemsWhenProjectSelected)
                  _NavbarItem(
                    key: Key('${item.route}-nav'),
                    routeNamed: item.route,
                    isSelected: routeState == item.route,
                    title: item.title,
                  ),
              ],
            ],
            rightItems: [
              Text('selected_project_title',
                      style: Theme.of(context).textTheme.titleLarge)
                  .tr(namedArgs: {
                'project': projectState.questionnaire?.title ?? 'None',
              }),
              const SizedBox(width: 16),
              ElevatedButton.icon(
                  onPressed: () async {
                    final result = await showDialog<Map<String, String>?>(
                        context: context,
                        builder: (context) => const AddQuestionnaireDialog());

                    if (result != null) {
                      ref.read(projectProvider.notifier).addQuestionnaire(
                          result['title']!, result['description']!);
                    }
                  },
                  icon: const Icon(Icons.add),
                  label: const Text('add_project').tr()),
              const SizedBox(width: 20),
              ElevatedButton.icon(
                  onPressed: () async {
                    ref.read(authProvider.notifier).logout();
                    context.go('/login');
                  },
                  icon: const Icon(Icons.logout),
                  label: const Text('logout').tr()),
            ],
          ),
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
        ],
      ),
    );
  }
}
