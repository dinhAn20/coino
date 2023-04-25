import 'package:flutter/material.dart';
import 'package:trading_app/models/juzu.dart';

class JuzuDetailItem extends StatelessWidget {
  const JuzuDetailItem(
      {Key? key,
         this.item})
      : super(key: key);
  final JuzuItem? item;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(item?.surah?.number?.toString()??'',
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(fontSize: 16)),
          SelectableText(item?.surah?.title?.toDisplay??'',

              style: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(fontSize: 16,fontWeight: FontWeight.bold,letterSpacing: 1.25)),
        ...?item?.ayahs?.map((e) => SelectableText(e.content?.toDisplay??'', style: Theme.of(context)
            .textTheme
            .bodyMedium
            ?.copyWith(fontSize: 16,fontWeight: FontWeight.bold,letterSpacing: 1.25))).toList()

        ],
      ),
    );
  }
}
