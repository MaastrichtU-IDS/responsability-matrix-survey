part of '../learn_more_page.dart';
class _LearnMoreSmall extends StatelessWidget {
  const _LearnMoreSmall({
    super.key,
    required this.contents});
  final _Contents contents;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Learn More'),
      ),
      endDrawer: Drawer(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: contents.tableOfContents,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: contents.content,
        ),
      ),
    );
  }
}