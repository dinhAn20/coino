import 'package:collection/collection.dart';
import 'package:trading_app/common/utils/extensions/datetime_extension.dart';
import 'package:flutter/material.dart';
import 'package:trading_app/common/utils/extensions/text_style_extension.dart';

import '../../common/theme/colors.dart';
import '../../common/utils/utils.dart';
import '../screens/crypto_detail_screen.dart';

class History extends StatelessWidget {
  const History({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: ["Time", "Price", "Quantity"]
              .mapIndexed(
                (i, e) => Expanded(
                  child: Text(e,
                      textAlign: i == 1
                          ? TextAlign.center
                          : i == 0
                              ? TextAlign.start
                              : TextAlign.end,
                      style: Theme.of(context).textTheme.bodyLarge),
                ),
              )
              .toList(),
        ),
        const Divider(thickness: 1, height: 24),
        ...List.generate(12, (index) {
          CryptoDataModel data = CryptoDataModel.fake();
          if (index.isEven) {
            data = CryptoDataModel(
                isSale: false,
                time: DateTime.now(),
                price: 17184.77,
                quantity: 2.001);
          }
          return Padding(
            padding: const EdgeInsets.only(bottom: 12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    data.time?.toTimeOfDay() ?? "",
                    style: Theme.of(context).textTheme.bodyLarge!.w600,
                  ),
                ),
                Expanded(
                  child: Text(
                    (formatCurrency(data.price ?? 0) ?? "").substring(1),
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyLarge!.w600.copyWith(
                        color: data.isSale == true
                            ? kErrorRedColor
                            : kPrimaryColor),
                  ),
                ),
                Expanded(
                  child: Text(
                    data.quantity?.toString() ?? "",
                    textAlign: TextAlign.end,
                    style: Theme.of(context).textTheme.bodyLarge!.w600,
                  ),
                ),
              ],
            ),
          );
        }).toList(),
      ],
    );
  }
}
