import 'package:flutter/material.dart';
import 'package:trading_app/common/constants/routes.dart';
import 'package:trading_app/common/utils/extensions/build_context_extension.dart';
import 'package:trading_app/models/chapter.dart';
import 'package:trading_app/modules/book/widgets/chapter_item.dart';
import '../../../models/book.dart';

class ChapterScreen extends StatefulWidget {
  const ChapterScreen({Key? key}) : super(key: key);

  @override
  State<ChapterScreen> createState() => _ChapterScreenState();
}

class _ChapterScreenState extends State<ChapterScreen> {
  Book? get book => context.getRouteArguments<Book>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(book?.name ?? ""),
        ),
        body: ListView.builder(
            padding: const EdgeInsets.all(8),
            itemCount: book?.chapters?.length,
            itemBuilder: (BuildContext context, int index) {
              Chapter? chapter = book?.chapters?[index];
              return ChapterItem(
                title: chapter?.title ?? "",
                ontap: () {
                  Navigator.pushNamed(context, kChapterDetailRoute,
                      arguments: chapter);
                },
                index: (index + 1).toString(),
              );
            }));
  }
}
