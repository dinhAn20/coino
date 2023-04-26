import 'package:flutter/material.dart';
import 'package:trading_app/common/utils/extensions/text_style_extension.dart';

class TitleWithSubtitleText extends StatelessWidget {
  const TitleWithSubtitleText({super.key, required this.title, this.subTitle});
  final String title;
  final String? subTitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.displaySmall,
        ),
        if (subTitle != null) const SizedBox(height: 12),
        if (subTitle != null)
          Text(
            subTitle!,
            style: Theme.of(context).textTheme.titleMedium!.w400,
          ),
      ],
    );
  }
}
