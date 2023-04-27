import 'package:flutter/material.dart';
import 'package:trading_app/common/theme/colors.dart';
import 'package:trading_app/common/utils/extensions/text_style_extension.dart';

import '../../../common/constants/images.dart';
import 'crypto_row_item.dart';
import 'ranking_list_tabs.dart';

class RankingList extends StatefulWidget {
  const RankingList({super.key});

  @override
  State<RankingList> createState() => _RankingListState();
}

class _RankingListState extends State<RankingList> {
  final List _list = const [
    {
      "name": "BTC",
      "divisionWith": "USDT",
      "value": 17185.06,
      "percentIncrease": 2.65,
      "image": kBitcoinIcon,
      "vol": 17204940467,
    },
    {
      "name": "ETH",
      "divisionWith": "USDT",
      "value": 1245.13,
      "percentIncrease": -0.65,
      "image": kEthereumIcon,
      "vol": 4940467,
    },
    {
      "name": "SOL",
      "divisionWith": "USDT",
      "value": 633.06,
      "percentIncrease": 7.65,
      "image": kSolanaIcon,
      "vol": 657525312,
    },
  ];

  RankingListTab _currentTab = RankingListTab.gainers;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 24),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Ranking List",
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(width: 4),
            Row(
              children: [
                Text(
                  "View All",
                  style: Theme.of(context).textTheme.bodyLarge!.primary,
                ),
                const SizedBox(width: 2),
                const Icon(
                  Icons.keyboard_arrow_right_rounded,
                  color: kPrimaryColor,
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 24),
        RankingListTabs(
          tab: _currentTab,
          onChanged: (RankingListTab tab) {
            _onChangeTab(tab);
          },
        ),
        const SizedBox(height: 12),
        ..._list
            .map(
              (e) => CryptoRowItem(e: e),
            )
            .toList()
      ],
    );
  }

  _onChangeTab(RankingListTab e) {
    if (_currentTab != e) {
      setState(() {
        _currentTab = e;
      });
    }
  }
}
