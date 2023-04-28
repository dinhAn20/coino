import 'package:flutter/material.dart';
import 'package:trading_app/common/utils/extensions/text_style_extension.dart';
import 'package:trading_app/widgets/tag_market.dart';

import '../../../common/constants/images.dart';
import '../../../widgets/cached_image.dart';

class NotificationItem extends StatelessWidget {
  const NotificationItem({
    super.key,
    required this.i,
  });
  final int i;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Column(
        children: [
          Row(
            children: [
              CachedImage(
                url: i.isEven ? kInforSquare : kTickSquare,
                width: 60,
                height: 60,
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Security Updates!",
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(height: 6),
                    Text(
                      "Today | 09:24 AM",
                      style:
                          Theme.of(context).textTheme.bodyMedium!.w500.gray700,
                    ),
                  ],
                ),
              ),
              if (i.isEven) const SizedBox(width: 16),
              if (i.isEven)
                const TagMarket(
                  label: "New",
                ),
            ],
          ),
          const SizedBox(height: 6),
          Text(
            "Now Coino has a Two-Factor Authentication. Try it now to make your account more secure.",
            style: Theme.of(context).textTheme.bodyMedium!.w500.gray700,
          ),
        ],
      ),
    );
  }
}
