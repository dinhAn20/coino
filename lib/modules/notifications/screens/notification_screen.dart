import 'package:flutter/material.dart';
import 'package:trading_app/common/constants/images.dart';
import 'package:trading_app/common/utils/extensions/string_extension.dart';
import 'package:trading_app/common/utils/extensions/text_style_extension.dart';
import 'package:trading_app/widgets/cached_image.dart';
import 'package:trading_app/widgets/list_content.dart';
import 'package:trading_app/widgets/tag_market.dart';

import '../../../models/pagination.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Notification"),
        actions: [
          GestureDetector(
            onTap: () {},
            child: kSetting.toSvg(
                height: 28,
                width: 28,
                color: Theme.of(context).appBarTheme.actionsIconTheme?.color),
          ),
          const SizedBox(width: 24),
        ],
      ),
      body: ListContent<int>(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        status: DataSourceStatus.success,
        emptyMsg: "You don't have any notification at this time",
        list: const [0, 1, 2, 3, 4, 6, 7, 6, 4, 3],
        onRefresh: () {},
        itemBuilder: (int i) => Padding(
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
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .w500
                              .gray700,
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
        ),
      ),
    );
  }
}
