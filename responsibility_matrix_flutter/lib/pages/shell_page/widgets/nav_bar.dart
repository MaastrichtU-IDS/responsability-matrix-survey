part of '../shell_page.dart';

class Navbar extends ConsumerWidget {
  const Navbar({super.key, required this.leftItems, required this.rightItems});

  final List<Widget> rightItems;
  final List<Widget> leftItems;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return LayoutBuilder(
      builder: (context, layout) => Material(
        elevation: 8,
        child: Container(
          width: MediaQuery.of(context).size.width,
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(children: [
              ...leftItems,
              const Spacer(),
              ...rightItems,
            ]),
          ),
        ),
      ),
    );
  }
}
