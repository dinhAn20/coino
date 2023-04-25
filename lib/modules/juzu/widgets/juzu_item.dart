import 'package:flutter/material.dart';

import 'package:trading_app/models/juzu.dart';



class JuzuItemScreen extends StatelessWidget {
  const JuzuItemScreen(
      {Key? key, required this.juzu, required this.onTap})
      : super(key: key);
 final Juzu  juzu;
 final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        margin: const EdgeInsets.symmetric(horizontal: 5,vertical: 5),
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: Text(juzu?.number.toString()??"",
                  style: Theme.of(context)
                      .textTheme
                      .labelSmall
                      ?.copyWith(fontSize: 18, fontWeight: FontWeight.w500)),
            ),
            Expanded(
              flex: 9,
              child: Text(juzu?.title?.toDisplay??"",
                  style: Theme.of(context)
                      .textTheme
                      .labelSmall
                      ?.copyWith(fontSize: 18, fontWeight: FontWeight.w500)),
            ),
            Expanded(
              flex: 1,
              child: Text(juzu.items?.length.toString()??"",
                  style: Theme.of(context)
                      .textTheme
                      .labelSmall
                      ?.copyWith(fontSize: 18, fontWeight: FontWeight.w500)),
            ),
          ],
        ),
      ),
    );
  }
}
