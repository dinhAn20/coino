import 'package:flutter/material.dart';
import 'package:trading_app/common/utils/extensions/text_style_extension.dart';

import '../../common/theme/colors.dart';
import '../../common/utils/utils.dart';
import '../screens/crypto_detail_screen.dart';

class Orders extends StatelessWidget {
  const Orders({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IntrinsicHeight(
          child: Row(
            children: [
              Expanded(
                child:
                    Text("Bid", style: Theme.of(context).textTheme.bodyLarge),
              ),
              const VerticalDivider(thickness: 1, width: 24),
              Expanded(
                child:
                    Text("Ask", style: Theme.of(context).textTheme.bodyLarge),
              ),
            ],
          ),
        ),
        const Divider(thickness: 1, height: 24),
        IntrinsicHeight(
          child: Row(
            children: [
              Expanded(
                child: Column(
                  children: [
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
                                (formatCurrency(data.price ?? 0) ?? "")
                                    .substring(1),
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .w600
                                    .copyWith(
                                        color: data.isSale == true
                                            ? kErrorRedColor
                                            : kPrimaryColor),
                              ),
                            ),
                            Expanded(
                              child: Text(
                                data.quantity?.toString() ?? "",
                                textAlign: TextAlign.end,
                                style:
                                    Theme.of(context).textTheme.bodyLarge!.w600,
                              ),
                            ),
                          ],
                        ),
                      );
                    }).toList(),
                  ],
                ),
              ),
              const VerticalDivider(thickness: 1, width: 24),
              Expanded(
                child: Column(
                  children: [
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
                                (formatCurrency(data.price ?? 0) ?? "")
                                    .substring(1),
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .w600
                                    .copyWith(
                                        color: data.isSale == true
                                            ? kErrorRedColor
                                            : kPrimaryColor),
                              ),
                            ),
                            Expanded(
                              child: Text(
                                data.quantity?.toString() ?? "",
                                textAlign: TextAlign.end,
                                style:
                                    Theme.of(context).textTheme.bodyLarge!.w600,
                              ),
                            ),
                          ],
                        ),
                      );
                    }).toList(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
