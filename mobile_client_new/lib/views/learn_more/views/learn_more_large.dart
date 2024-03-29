part of '../learn_more_page.dart';

class _LearnMoreLarge extends StatelessWidget {
  const _LearnMoreLarge({required this.contents});
  final _Contents contents;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Learn More'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (MediaQuery.of(context).size.width > 300)
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: contents.tableOfContents,
                    ),
                  ),
                ),
              Expanded(
                flex: 3,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: contents.content,
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
