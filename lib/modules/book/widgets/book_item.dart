import 'package:flutter/material.dart';
import 'package:trading_app/common/constants/routes.dart';
import 'package:trading_app/models/book.dart';
import '../../../widgets/cached_image.dart';

class BookItem extends StatelessWidget {
  const BookItem(
      {Key? key,
      required this.book,
      required this.widthItem,
      required this.heightText})
      : super(key: key);
  final Book book;
  final double widthItem;
  final double heightText;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(kChapterRoute, arguments: book);
      },
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            CachedImage(
              fit: BoxFit.cover,
              url: book.image,
              width: widthItem,
              height: widthItem,
            ),
            const SizedBox(height: 5),
            SizedBox(
              height: heightText,
              child: Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Text(book.name ?? "",
                    style: Theme.of(context)
                        .textTheme
                        .labelMedium
                        ?.copyWith(fontWeight: FontWeight.bold, fontSize: 15)),
              ),
            ),
          ]),
    );
  }
}
