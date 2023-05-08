import 'package:flutter/material.dart';
import 'package:trading_app/common/constants/images.dart';
import 'package:trading_app/common/utils/extensions/string_extension.dart';
import 'package:trading_app/widgets/list_content.dart';

import '../../../models/pagination.dart';
import '../widgets/notification_item.dart';

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
            child: kSettingIcon.toSvg(
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
        itemBuilder: (int i) => NotificationItem(i: i),
      ),
    );
  }
}
