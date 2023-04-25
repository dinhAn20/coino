import 'package:flutter/material.dart';

class ChapterItem extends StatelessWidget {
  const ChapterItem(
      {Key? key, required this.title, required this.index, required this.ontap})
      : super(key: key);
  final String title;
  final String index;
  final VoidCallback ontap;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: ontap,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('$index.',
                style: Theme.of(context)
                    .textTheme
                    .labelSmall
                    ?.copyWith(fontSize: 15, fontWeight: FontWeight.bold)),
            const SizedBox(
              width: 5,
            ),
            Text(title,
                style: Theme.of(context)
                    .textTheme
                    .labelSmall
                    ?.copyWith(fontSize: 15, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}
