import 'package:flutter/material.dart';
import 'package:mobile_client_new/style/style_provider.dart';
import 'package:mobile_client_new/widgets/navbar/navigation_notification.dart';

class NavbarItem extends StatefulWidget {
  const NavbarItem(
      {Key? key,
      required this.title,
      required this.isSelected,
      required this.route})
      : super(key: key);
  final String title;
  final String route;
  final bool isSelected;
  @override
  State<NavbarItem> createState() => _NavbarItemState();
}

class _NavbarItemState extends State<NavbarItem>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<TextStyle> _textStyleAnimation;
  final ValueNotifier<bool> _isSelected = ValueNotifier(false);
  @override
  initState() {
    super.initState();
    _isSelected.addListener(() {
      if (_isSelected.value) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    });
  }

  bool hover = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 250),
    );
    _textStyleAnimation = TextStyleTween(
      end: Theme.of(context).textTheme.headline6!.copyWith(
            color: StyleProvider.of(context).colors.appPrimaryColor,
          ),
      begin: Theme.of(context).textTheme.headline6!.copyWith(
            color: Colors.grey[500],
          ),
    ).animate(_controller)
      ..addListener(() {
        setState(() {});
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.isSelected != _isSelected.value) {
      _isSelected.value = widget.isSelected;
    }
    final Widget child = Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Text(
        widget.title,
        style: _textStyleAnimation.value,
      ),
    );
    return GestureDetector(
      onTap: () {
        NavigationNotification(widget.route).dispatch(context);
      },
      child: MouseRegion(
        cursor: hover ? SystemMouseCursors.click : SystemMouseCursors.basic,
        onEnter: (event) {
          _controller.forward();
          setState(() {
            hover = true;
          });
        },
        onExit: (event) {
          if (!_isSelected.value) _controller.reverse();
          setState(() {
            hover = false;
          });
        },
        child: child,
      ),
    );
  }
}
