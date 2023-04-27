import 'package:flutter/material.dart';
import 'package:trading_app/common/theme/colors.dart';
import 'package:trading_app/common/utils/extensions/text_style_extension.dart';

class TagMarket extends StatelessWidget {
  const TagMarket(
      {Key? key,
      required this.label,
      this.backgroundColor,
      this.borderColor = kPrimaryColor,
      this.hasBorder = false,
      this.labelColor})
      : super(key: key);
  final String label;
  final Color? backgroundColor;
  final Color borderColor;
  final Color? labelColor;
  final bool hasBorder;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 10),
      decoration: BoxDecoration(
          color: backgroundColor ?? kPrimaryColor,
          borderRadius: BorderRadius.circular(6),
          border: hasBorder ? Border.all(color: borderColor) : null),
      child: Center(
        child: Text(label,
            style: Theme.of(context)
                .textTheme
                .labelSmall!
                .w600
                .copyWith(color: labelColor ?? kWhiteColor)),
      ),
    );
  }
}
