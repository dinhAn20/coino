
import 'package:flutter/material.dart';
import 'package:trading_app/models/ayah.dart';

import '../../../common/theme/colors.dart';
import '../../../widgets/multi_language_text.dart';
class AyahItem extends StatefulWidget {
  const AyahItem({
    Key? key,
    required this.ayah,
  }) : super(key: key);
  final Ayah? ayah;

  @override
  State<AyahItem> createState() => _AyahItemState();
}

class _AyahItemState extends State<AyahItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          border: Border(bottom: BorderSide(width: 1, color: kLightGreyColor))),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "${widget.ayah?.number.toString() ?? ""}.",
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(width: 5),
          MultiLanguageText(widget.ayah?.title,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(fontSize: 15, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
