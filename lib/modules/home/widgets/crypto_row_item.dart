import 'package:auto_size_text/auto_size_text.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:trading_app/common/utils/extensions/text_style_extension.dart';

import '../../../common/theme/colors.dart';
import '../../../common/utils/utils.dart';
import '../../../widgets/cached_image.dart';

class CryptoRowItem extends StatelessWidget {
  const CryptoRowItem({super.key, required this.e});
  final Map e;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CachedImage(
            url: e["image"],
            width: 48,
            height: 48,
          ),
          const SizedBox(width: 14),
          Row(
            children: [
              SizedBox(
                width: 130,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: TextSpan(
                        text: e['name'],
                        style: Theme.of(context).textTheme.titleLarge,
                        children: [
                          TextSpan(
                            text: " / ${e["divisionWith"]}",
                            style:
                                Theme.of(context).textTheme.titleLarge!.gray700,
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 6),
                    AutoSizeText(
                      "Vol ${formatCurrency(parseDouble(e['vol']) ?? 0)}",
                      maxFontSize: 14,
                      minFontSize: 10,
                      maxLines: 1,
                      style:
                          Theme.of(context).textTheme.bodyMedium!.gray700.w600,
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              SizedBox(width: 72, height: 32, child: LineChart(sampleData())),
            ],
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                AutoSizeText(
                  formatCurrency(e['value']) ?? "",
                  maxFontSize: 14,
                  minFontSize: 10,
                  maxLines: 1,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const SizedBox(height: 4),
                Text(
                  "${e['percentIncrease'] > 0 ? "+" : ""}${e['percentIncrease']}%",
                  style: e['percentIncrease'] > 0
                      ? Theme.of(context).textTheme.bodySmall!.primary
                      : Theme.of(context).textTheme.bodySmall!.red,
                )
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
        enabled: false,
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

      // minX: 0,
      maxX: 20,
      maxY: 20,
      minY: 0,
      lineBarsData: linesBarData(),
    );
  }

  List<LineChartBarData> linesBarData() {
    return [
      LineChartBarData(
        spots: [
          const FlSpot(1, 15),
          const FlSpot(3, 3),
          const FlSpot(4, 7.7),
          const FlSpot(5, 1.5),
          const FlSpot(6, 2.6),
          const FlSpot(7, 18),
          const FlSpot(9, 10),
          const FlSpot(10, 15.8),
          const FlSpot(11, 11.6),
          const FlSpot(12, 12),
          const FlSpot(13, 5),
          const FlSpot(14, 3.7),
          const FlSpot(15, 8.7),
          const FlSpot(16, 19),
          const FlSpot(17, 15),
          const FlSpot(20, 13),
        ],
        color: kPrimaryColor,
        barWidth: 2,
        isStrokeCapRound: true,
        dotData: FlDotData(
          show: false,
        ),
        isCurved: true,
        belowBarData: BarAreaData(
            show: true,
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  kPrimaryColor.withOpacity(0.2),
                  kPrimaryColor.withOpacity(0),
                ])),
      ),
    ];
  }
}
