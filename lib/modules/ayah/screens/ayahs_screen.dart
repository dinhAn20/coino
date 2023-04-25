import 'package:flutter/material.dart';
import 'package:trading_app/common/utils/extensions/build_context_extension.dart';
import 'package:trading_app/models/ayah.dart';
import '../../../widgets/multi_language_text.dart';
import '../../../widgets/text_field.dart';
import '../widgets/ayah_item.dart';
import 'ayah_detail_screen.dart';

class AyahsScreen extends StatefulWidget {
  const AyahsScreen({Key? key, this.args}) : super(key: key);
  final AyahDetailArgs? args;

  @override
  State<AyahsScreen> createState() => _AyahsScreenState();
}

class _AyahsScreenState extends State<AyahsScreen> {
  AyahDetailArgs? get _args =>
      context.getRouteArguments<AyahDetailArgs>() ?? widget.args;
  late List<Ayah> _items = _args?.ayahs ?? [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: MultiLanguageText(
            _args?.surahTitle,
            space: 0,
          ),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: SearchTextField(onChanged: (String keyword) {
                if (keyword.isNotEmpty) {
                  setState(() {
                    _items = _args?.ayahs
                            .where((e) =>
                                (e.title?.enText
                                        ?.toLowerCase()
                                        .contains(keyword.toLowerCase()) ??
                                    false) ||
                                (e.title?.enText
                                        ?.toLowerCase()
                                        .contains(keyword.toLowerCase()) ??
                                    false) ||
                                (e.title?.enText
                                        ?.toLowerCase()
                                        .contains(keyword.toLowerCase()) ??
                                    false))
                            .toList() ??
                        [];
                  });
                } else {
                  setState(() {
                    _items = _args?.ayahs ?? [];
                  });
                }
              }),
            ),
            Expanded(
                child: ListView.builder(
                    padding: const EdgeInsets.all(10),
                    itemCount: _items.length,
                    itemBuilder: (BuildContext context, int index) {
                      Ayah? ayah = _items[index];
                      return GestureDetector(
                        behavior: HitTestBehavior.opaque,
                        onTap: () {
                          Navigator.pop(context, ayah);
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 20),
                          child: AyahItem(ayah: ayah),
                        ),
                      );
                    }))
          ],
        ));
  }
}
