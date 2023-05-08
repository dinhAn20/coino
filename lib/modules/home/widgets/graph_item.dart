import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:trading_app/common/utils/extensions/text_style_extension.dart';

import '../../../common/constants/images.dart';
import '../../../common/theme/colors.dart';
import '../../../widgets/cached_image.dart';

class GraphItem extends StatelessWidget {
  const GraphItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 16),
      width: 160,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          // color: kDark2,
          border: Border.all(color: Theme.of(context).dividerColor)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(14, 14, 14, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CachedImage(
                    url: kSolanaIcon,
                    width: 36,
                    height: 36,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "ETH/USDT",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        "+1.77%",
                        style: Theme.of(context).textTheme.bodySmall!.primary,
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
          SizedBox(height: 90, child: LineChart(sampleData())),
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
