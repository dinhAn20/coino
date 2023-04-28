import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:trading_app/common/constants/images.dart';
import 'package:trading_app/common/theme/colors.dart';
import 'package:trading_app/common/utils/extensions/string_extension.dart';
import 'package:trading_app/common/utils/extensions/text_style_extension.dart';
import 'package:trading_app/widgets/text_field.dart';

import '../widgets/crypto_search_item.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final FocusNode _focusNode = FocusNode();
  final TextEditingController _searchController = TextEditingController();
  Color _prefixColor = kGray400;
  Color _fillColor = kGray100;

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      if (_focusNode.hasFocus) {
        _prefixColor = kPrimaryColor;
        _fillColor = kGreenA70014;
      } else {
        _prefixColor = kGray400;
        _fillColor = kGray100;
      }
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Column(
        children: [
          const SizedBox(height: 2),
          BasicTextField(
            controller: _searchController,
            contentPadding: const EdgeInsets.all(14),
            textStyle: Theme.of(context).textTheme.bodyLarge!.w600,
            fillColor: _fillColor,
            filled: true,
            onClear: () {},
            focusNode: _focusNode,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
            prefixIcon:
                kSearch.toSvg(color: _prefixColor, height: 20, width: 20),
          ),
          const SizedBox(height: 2),
        ],
      )),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: const [
            PreviousSearch(),
            SearchBody(),
          ],
        ),
      ),
    );
  }
}

class SearchBody extends StatelessWidget {
  const SearchBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 24),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Sort by",
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(width: 4),
              Row(
                children: [
                  Text(
                    "Most Popular",
                    style: Theme.of(context).textTheme.bodyLarge!.primary,
                  ),
                  const SizedBox(width: 12),
                  const Icon(
                    CupertinoIcons.arrow_up_arrow_down,
                    color: kPrimaryColor,
                    size: 20,
                  ),
                ],
              ),
            ],
          ),
        ),
        ...List.generate(
          7,
          (index) => Padding(
            padding: const EdgeInsets.only(bottom: 24),
            child: CryptoSearchItem(
              isFavorite: index.isEven,
            ),
          ),
        ).toList(),
      ],
    );
  }
}

class PreviousSearch extends StatelessWidget {
  const PreviousSearch({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 24),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Previous search",
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              GestureDetector(
                onTap: () {},
                child: const Icon(
                  Icons.close_rounded,
                  size: 24,
                  color: kGray500,
                ),
              ),
            ],
          ),
        ),
        ...List.generate(
          7,
          (index) => const Padding(
            padding: EdgeInsets.only(bottom: 24),
            child: CryptoSearchItem(
              isHistory: true,
            ),
          ),
        ).toList(),
      ],
    );
  }
}
