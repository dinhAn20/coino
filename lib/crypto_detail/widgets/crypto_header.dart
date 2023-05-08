import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:trading_app/common/utils/extensions/text_style_extension.dart';

import '../../common/utils/utils.dart';

class CryptoHeader extends StatelessWidget {
  const CryptoHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        children: [
          Expanded(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AutoSizeText(
                "17,185.06",
                maxFontSize: 40,
                minFontSize: 30,
                maxLines: 1,
                style: Theme.of(context).textTheme.displayMedium,
              ),
              const SizedBox(height: 10),
              AutoSizeText.rich(
                TextSpan(
                    text: formatCurrency(17185.06),
                    style: Theme.of(context).textTheme.bodyMedium!.w600.gray700,
                    children: [
                      TextSpan(
                        text: "(+ 0.45%)",
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .w600
                            .primary,
                      )
                    ]),
                maxFontSize: 14,
                minFontSize: 12,
                maxLines: 1,
              ),
            ],
          )),
          const SizedBox(width: 12),
          Expanded(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "24h Vol",
                    style: Theme.of(context).textTheme.bodyMedium!.w600.gray700,
                  ),
                  const SizedBox(width: 4),
                  Expanded(
                    child: AutoSizeText(
                      formatCurrency(171858822472.06) ?? "",
                      maxFontSize: 16,
                      textAlign: TextAlign.end,
                      minFontSize: 10,
                      maxLines: 1,
                      style: Theme.of(context).textTheme.bodyLarge!.w600,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "High Price",
                    style: Theme.of(context).textTheme.bodyMedium!.w600.gray700,
                  ),
                  const SizedBox(width: 4),
                  Expanded(
                    child: AutoSizeText(
                      formatCurrency(17185.06) ?? "",
                      maxFontSize: 16,
                      textAlign: TextAlign.end,
                      minFontSize: 10,
                      maxLines: 1,
                      style: Theme.of(context).textTheme.bodyLarge!.w600,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Low Price",
                    style: Theme.of(context).textTheme.bodyMedium!.w600.gray700,
                  ),
                  const SizedBox(width: 4),
                  Expanded(
                    child: AutoSizeText(
                      formatCurrency(17185.06) ?? "",
                      maxFontSize: 16,
                      minFontSize: 10,
                      maxLines: 1,
                      textAlign: TextAlign.end,
                      style: Theme.of(context).textTheme.bodyLarge!.w600,
                    ),
                  ),
                ],
              ),
            ],
          )),
        ],
      ),
    );
  }
}
