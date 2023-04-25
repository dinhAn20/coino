import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:trading_app/common/utils/extensions/build_context_extension.dart';
import '../../../models/chapter.dart';

class ChapterDetailScreen extends StatefulWidget {
  const ChapterDetailScreen({Key? key}) : super(key: key);

  @override
  State<ChapterDetailScreen> createState() => _ChapterDetailScreenState();
}

class _ChapterDetailScreenState extends State<ChapterDetailScreen> {
  Chapter? get chapter => context.getRouteArguments<Chapter>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(chapter?.title ?? ""),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
              child: Padding(
            padding: const EdgeInsets.all(10),
            child: HtmlWidget(chapter?.content ?? "",
                textStyle: Theme.of(context)
                    .textTheme
                    .labelSmall
                    ?.copyWith(fontSize: 15)),
          )),
        ));
  }
}
