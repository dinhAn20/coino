import 'package:flutter/material.dart';

enum RankingListTab { gainers, losers, volof24h }

extension RankingListTabX on RankingListTab {
  String get displayName {
    switch (this) {
      case RankingListTab.gainers:
        return "Gainers";
      case RankingListTab.losers:
        return "Losers";
      case RankingListTab.volof24h:
        return "24h Vol";
    }
  }
}

class RankingListTabs extends StatelessWidget {
  const RankingListTabs({
    super.key,
    required this.tab,
    required this.onChanged,
  });

  final RankingListTab tab;
  final Function(RankingListTab) onChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: RankingListTab.values
          .map(
            (e) => Expanded(
              child: GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () => onChanged.call(e),
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                          color: tab == e
                              ? Theme.of(context).tabBarTheme.indicatorColor!
                              : Theme.of(context).dividerColor,
                          width: tab == e ? 4 : 1),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      e.displayName,
                      style: tab == e
                          ? Theme.of(context).tabBarTheme.labelStyle
                          : Theme.of(context).tabBarTheme.unselectedLabelStyle,
                    ),
                  ),
                ),
              ),
            ),
          )
          .toList(),
    );
  }
}
