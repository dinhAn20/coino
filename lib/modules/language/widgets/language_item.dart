import 'package:flutter/material.dart';
import '../../../widgets/cached_image.dart';

class LanguageItem extends StatelessWidget {
  const LanguageItem(
      {Key? key,
      required this.flag,
      required this.name,
      this.isCurrentLanguage = false})
      : super(key: key);
  final String flag;
  final String name;
  final bool isCurrentLanguage;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Row(
        children: [
          CachedImage(url: flag, width: 50, height: 50),
          const SizedBox(
            width: 20,
          ),
          Expanded(
            child: Text(
              name,
              style: Theme.of(context)
                  .textTheme
                  .labelMedium
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
          ),
          if (isCurrentLanguage == true)
            const Icon(
              Icons.check,
              color: Colors.blue,
            ),
        ],
      ),
    );
  }
}
