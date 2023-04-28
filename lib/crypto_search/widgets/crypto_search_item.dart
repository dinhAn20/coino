import 'package:flutter/material.dart';
import 'package:trading_app/common/utils/extensions/string_extension.dart';

import '../../common/constants/images.dart';
import '../../common/theme/colors.dart';
import '../../widgets/cached_image.dart';

class CryptoSearchItem extends StatelessWidget {
  const CryptoSearchItem({
    super.key,
    this.isHistory = false,
    this.isFavorite = false,
  });
  final bool isHistory;
  final bool isFavorite;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const CachedImage(url: kEthereumIcon, height: 48, width: 48),
        const SizedBox(width: 12),
        Text(
          "ETH / USDT",
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const Spacer(),
        isHistory
            ? kTimeCircleIcon.toSvg(width: 24, height: 24, color: kGray500)
            : GestureDetector(
                child: Icon(
                  !isFavorite ? Icons.star_border_rounded : Icons.star_rounded,
                  color: !isFavorite ? kGray900 : kSecondaryColor,
                ),
              ),
      ],
    );
  }
}
