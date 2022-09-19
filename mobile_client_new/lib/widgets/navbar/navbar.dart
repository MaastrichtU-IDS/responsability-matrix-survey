import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_client_new/widgets/navbar/nav_bar_controller.dart';
import 'package:mobile_client_new/widgets/navbar/navigation_notification.dart';

class Navbar extends ConsumerStatefulWidget {
  const Navbar(
      {super.key,
      required this.navController,
      required this.leftItems,
      required this.rightItems});

  final List<Widget> rightItems;
  final List<Widget> leftItems;
  final StateNotifierProvider<NavBarController, String> navController;
  @override
  ConsumerState<Navbar> createState() => _NavbarState();
}

class _NavbarState extends ConsumerState<Navbar> {
  @override
  Widget build(BuildContext context) {
    final bool isDesktop = MediaQuery.of(context).size.width > 1000;
    return LayoutBuilder(
      builder: (context, layout) =>
          NotificationListener<NavigationNotification>(
        onNotification: (NavigationNotification notification) {
          String? error = ref
              .read(widget.navController.notifier)
              .navigateTo(notification.route);
          if (error != null) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(error),
            ));
          }
          setState(() {});
          return true;
        },
        child: Material(
          elevation: 8,
          child: Container(
            width: MediaQuery.of(context).size.width,
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Flex(
                  direction: isDesktop ? Axis.horizontal : Axis.vertical,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ...widget.leftItems,
                    if (isDesktop) const Spacer(),
                    ...widget.rightItems,
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
