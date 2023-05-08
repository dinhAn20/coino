import 'package:collection/collection.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:trading_app/common/constants/images.dart';
import 'package:trading_app/common/theme/colors.dart';
import 'package:trading_app/common/utils/extensions/string_extension.dart';
import 'package:trading_app/common/utils/extensions/text_style_extension.dart';
import 'package:trading_app/common/utils/utils.dart';
import 'package:trading_app/crypto_detail/widgets/history.dart';
import 'package:trading_app/widgets/button.dart';
import 'package:trading_app/widgets/tag_market.dart';

import '../widgets/crypto_header.dart';
import '../widgets/orders.dart';

enum ChartTimeType { day, week, month, quarter, year, all }

extension ChartTimeTypeX on ChartTimeType {
  String get displayName {
    switch (this) {
      case ChartTimeType.day:
        return '1D';
      case ChartTimeType.week:
        return '1W';
      case ChartTimeType.month:
        return '1M';
      case ChartTimeType.quarter:
        return '3M';
      case ChartTimeType.year:
        return '1Y';
      case ChartTimeType.all:
        return 'All Time';
    }
  }
}

enum CryptoDetailTab { orders, history }

extension CryptoDetailTabX on CryptoDetailTab {
  String get displayName {
    switch (this) {
      case CryptoDetailTab.orders:
        return 'Orders';
      case CryptoDetailTab.history:
        return 'History';
    }
  }
}

class CryptoDetailScreen extends StatefulWidget {
  const CryptoDetailScreen({super.key});

  @override
  State<CryptoDetailScreen> createState() => _CryptoDetailScreenState();
}

class _CryptoDetailScreenState extends State<CryptoDetailScreen> {
  bool isFavorite = true;
  List<double> list = [4.5, 5.5, 4.7, 10.8, 6.7, 8.8, 4.3, 10, 5.5];
  ChartTimeType _type = ChartTimeType.day;
  CryptoDetailTab _tab = CryptoDetailTab.orders;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("BTC/USDT"),
        actions: [
          GestureDetector(
            child: Icon(
              !isFavorite ? Icons.star_border_rounded : Icons.star_rounded,
              color: !isFavorite
                  ? Theme.of(context).appBarTheme.actionsIconTheme?.color
                  : kSecondaryColor,
              size: 28,
            ),
          ),
          const SizedBox(width: 20),
          GestureDetector(
            onTap: () {},
            child: kSendIcon.toSvg(
                width: 28,
                height: 28,
                color: Theme.of(context).appBarTheme.actionsIconTheme?.color),
          ),
          const SizedBox(width: 20),
          GestureDetector(
            onTap: () {},
            child: kMoreCircleIcon.toSvg(
                width: 28,
                height: 28,
                color: Theme.of(context).appBarTheme.actionsIconTheme?.color),
          ),
          const SizedBox(width: 24),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 28),
                  const CryptoHeader(),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24),
                    child: Divider(height: 48, thickness: 1),
                  ),
                  SizedBox(
                    height: 300,
                    child: LineChart(
                      sampleData(),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      children: [
                        Wrap(
                          children: [
                            ...ChartTimeType.values.map(
                              (e) => Container(
                                margin: const EdgeInsets.only(right: 12),
                                child: GestureDetector(
                                  onTap: () => setState(() {
                                    _type = e;
                                  }),
                                  child: _type == e
                                      ? TagMarket(
                                          label: e.displayName,
                                          labelStyle: Theme.of(context)
                                              .textTheme
                                              .bodyMedium!
                                              .w600
                                              .copyWith(color: kWhiteColor),
                                        )
                                      : TagMarket(
                                          label: e.displayName,
                                          labelStyle: Theme.of(context)
                                              .textTheme
                                              .bodyMedium!
                                              .w600
                                              .copyWith(color: kPrimaryColor),
                                          backgroundColor: Colors.transparent,
                                        ),
                                ),
                              ),
                            )
                          ],
                        ),
                        const Spacer(),
                        Expanded(
                            child: InkWell(
                                onTap: () {},
                                child: kChartIcon.toSvg(width: 24, height: 24)))
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      children: [
                        Row(
                          children: CryptoDetailTab.values
                              .map(
                                (e) => Expanded(
                                  child: GestureDetector(
                                    behavior: HitTestBehavior.opaque,
                                    onTap: () => setState(() {
                                      _tab = e;
                                    }),
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 16),
                                      decoration: BoxDecoration(
                                        border: Border(
                                          bottom: BorderSide(
                                              color: _tab == e
                                                  ? Theme.of(context)
                                                      .tabBarTheme
                                                      .indicatorColor!
                                                  : Theme.of(context)
                                                      .dividerColor,
                                              width: _tab == e ? 4 : 1),
                                        ),
                                      ),
                                      child: Center(
                                        child: Text(
                                          e.displayName,
                                          style: _tab == e
                                              ? Theme.of(context)
                                                  .tabBarTheme
                                                  .labelStyle
                                              : Theme.of(context)
                                                  .tabBarTheme
                                                  .unselectedLabelStyle,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              )
                              .toList(),
                        ),
                        const SizedBox(height: 24),
                        _tab == CryptoDetailTab.orders
                            ? const Orders()
                            : const History(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          const Divider(thickness: 1, height: 1),
          Padding(
            padding: const EdgeInsets.fromLTRB(24, 24, 24, 36),
            child: Row(
              children: [
                Expanded(
                  child: BasicButton(
                    padding: const EdgeInsets.symmetric(vertical: 18),
                    backgroundColor: kPrimary100Color,
                    onPressed: () {},
                    textStyle:
                        Theme.of(context).textTheme.bodyLarge!.w600.primary,
                    label: "Sell",
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: BasicButton(
                    label: "Buy",
                    onPressed: () {},
                    padding: const EdgeInsets.symmetric(vertical: 18),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  LineChartData sampleData() {
    return LineChartData(
      lineTouchData: LineTouchData(
        enabled: true,
        touchTooltipData: LineTouchTooltipData(
          tooltipBgColor: Colors.transparent,
          fitInsideHorizontally: true,
          tooltipMargin: 0,
          getTooltipItems: (touchedSpots) {
            return touchedSpots.map(
              (LineBarSpot touchedSpot) {
                final textStyle = Theme.of(context).textTheme.bodyLarge!;
                return LineTooltipItem(
                  formatCurrency(list[touchedSpot.spotIndex]) ?? "",
                  textStyle,
                );
              },
            ).toList();
          },
        ),
        getTouchedSpotIndicator:
            (LineChartBarData barData, List<int> indicators) {
          return indicators.map(
            (int index) {
              final line = FlLine();
              return TouchedSpotIndicatorData(
                line,
                FlDotData(show: true),
              );
            },
          ).toList();
        },
        getTouchLineEnd: (_, __) => 0,
      ),
      gridData: FlGridData(
        show: false,
      ),
      titlesData: FlTitlesData(
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: false,
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: false,
          ),
        ),
        topTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: false,
          ),
        ),
        rightTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: false,
          ),
        ),
      ),
      borderData: FlBorderData(
        show: false,
      ),
      maxX: list.length.toDouble(),
      maxY: list.max,
      minY: list.min,
      lineBarsData: linesBarData(),
    );
  }

  List<LineChartBarData> linesBarData() {
    return [
      LineChartBarData(
        spots:
            list.mapIndexed((i, e) => FlSpot((i + 1).toDouble(), e)).toList(),
        color: kPrimaryColor,
        barWidth: 3,
        isStrokeCapRound: true,
        dotData: FlDotData(
            checkToShowDot: (spot, barData) {
              return [list.max.toDouble(), list.min.toDouble()]
                  .contains(spot.y);
            },
            show: true),
        isCurved: true,
        belowBarData: BarAreaData(
          show: true,
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              kPrimaryColor.withOpacity(0.2),
              kPrimaryColor.withOpacity(0),
            ],
          ),
        ),
      ),
    ];
  }
}

class CryptoDataModel {
  final DateTime? time;
  final double? price;
  final double? quantity;
  final bool? isSale;
  const CryptoDataModel({
    this.isSale,
    this.time,
    this.price,
    this.quantity,
  });

  static CryptoDataModel fake() {
    return CryptoDataModel(
        time: DateTime.now(), price: 17184.99, quantity: 1.041, isSale: true);
  }
}
