import 'package:flutter/material.dart';
import 'package:trading_app/common/theme/colors.dart';
import 'package:trading_app/models/multi_text.dart';

import '../../../widgets/multi_language_text.dart';

class SurahItem extends StatelessWidget {
  const SurahItem(
      {Key? key,
      required this.title,
      required this.number,
      required this.ayahs,
      required this.onTap})
      : super(key: key);
  final MultiText? title;
  final String number;
  final int ayahs;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        child: Container(
          decoration: const BoxDecoration(
              border:
                  Border(bottom: BorderSide(width: 1, color: kLightGreyColor))),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("$number.",
                  style: Theme.of(context)
                      .textTheme
                      .labelSmall
                      ?.copyWith(fontSize: 15, fontWeight: FontWeight.bold)),
              const SizedBox(width: 5),
              Expanded(
                child: MultiLanguageText(title,
                    style: Theme.of(context)
                        .textTheme
                        .labelSmall
                        ?.copyWith(fontSize: 15, fontWeight: FontWeight.bold)),
              ),
              const SizedBox(width: 5),
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: kLightGreyColor)),
                child: Center(
                  child: Text(ayahs.toString(),
                      style: Theme.of(context).textTheme.labelSmall?.copyWith(
                          fontSize: 12, fontWeight: FontWeight.bold)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
