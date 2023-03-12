part of '../shell_page.dart';

class _NavbarItem extends ConsumerStatefulWidget {
  const _NavbarItem(
      {Key? key,
      required this.title,
      required this.isSelected,
      required this.routeNamed})
      : super(key: key);
  final String title;
  final String routeNamed;
  final bool isSelected;
  @override
  ConsumerState<_NavbarItem> createState() => _NavbarItemState();
}

class _NavbarItemState extends ConsumerState<_NavbarItem>
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
      end: Theme.of(context).textTheme.titleLarge!.copyWith(
            color: Theme.of(context).primaryColor,
          ),
      begin: Theme.of(context).textTheme.titleLarge!.copyWith(
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
    final state = ref.watch(shellProvider);
    if (widget.isSelected != _isSelected.value) {
      _isSelected.value = state == widget.routeNamed;
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
        ref.read(shellProvider.notifier).navigateTo(widget.routeNamed);
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
