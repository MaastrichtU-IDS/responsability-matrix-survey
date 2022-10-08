import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobile_client_new/views/learn_more/widgets/content_item.dart';
import 'package:mobile_client_new/views/learn_more/widgets/table_of_content_item.dart';
import 'package:mobile_client_new/widgets/responsive_layout/responsive_layout.dart';

class LearnMorePage extends StatefulWidget {
  const LearnMorePage({super.key});
  static const String routeName = '/learn-more';
  @override
  State<LearnMorePage> createState() => _LearnMorePageState();
}

class _LearnMorePageState extends State<LearnMorePage> {
  final List<GlobalKey> keys = <GlobalKey>[];

  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: rootBundle.loadString('assets/jsons/learn_more.json'),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final List<dynamic> data = jsonDecode(snapshot.data as String);
          final List<_ContentModel> contentModel =
              data.map((e) => _ContentModel.fromJson(e)).toList();
          final _Contents contents = _getContent(contentModel);
          return ResponsiveLayout(
              smallScreen: _LearnMoreSmall(
                contents: contents,
              ),
              largeScreen: _LearnMoreLarge(
                contents: contents,
              ));
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  _Contents _getContent(List<_ContentModel> contents, [int level = 0]) {
    final List<Widget> tableOfContents = [];
    final List<Widget> content = [];
    for (final item in contents) {
      final GlobalKey key = GlobalKey(debugLabel: item.title);
      tableOfContents.add(TableOfContentItem(
        title: item.title,
        jumpKey: key,
        level: level,
      ));
      content.add(
        ContentItem(
          key: key,
          title: item.title,
          content: item.content,
          level: level,
        ),
      );
      _Contents subContents = _getContent(item.subContent, level + 1);
      tableOfContents.addAll(subContents.tableOfContents);
      content.addAll(subContents.content);
    }
    return _Contents(tableOfContents, content);
  }
}

class _LearnMoreLarge extends StatelessWidget {
  const _LearnMoreLarge({super.key, required this.contents});
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
                  flex: 1,
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: contents.tableOfContents,
                    ),
                  ),
                ),
              Expanded(
                flex: 3,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
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

class _LearnMoreSmall extends StatelessWidget {
  const _LearnMoreSmall({super.key, required this.contents});
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
            mainAxisAlignment: MainAxisAlignment.start,
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

class _Contents {
  final List<Widget> tableOfContents;
  final List<Widget> content;

  const _Contents(this.tableOfContents, this.content);
}

class _ContentModel {
  final String key;
  final String title;
  final String content;
  final List<_ContentModel> subContent;
  final Widget? optionalWidget;
  const _ContentModel({
    required this.key,
    required this.title,
    required this.content,
    required this.subContent,
    this.optionalWidget,
  });

  factory _ContentModel.fromJson(Map<String, dynamic> json) {
    return _ContentModel(
      key: json['key'],
      title: json['title'],
      content: json['content'],
      subContent: json['subContent'] != null
          ? json['subContent']
              .map<_ContentModel>((e) => _ContentModel.fromJson(e))
              .toList()
          : [],
    );
  }
}
