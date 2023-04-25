import 'package:flutter/material.dart';
import 'package:trading_app/common/constants/routes.dart';
import 'package:trading_app/common/utils/extensions/build_context_extension.dart';
import '../../../models/juzu.dart';
import '../../ayah/screens/ayah_detail_screen.dart';
import '../../home/widgets/surah_item.dart';

class JuZuDetailScreen extends StatefulWidget {
  const JuZuDetailScreen({Key? key}) : super(key: key);

  @override
  State<JuZuDetailScreen> createState() => _JuZuDetailScreenState();
}

class _JuZuDetailScreenState extends State<JuZuDetailScreen> {
  Juzu? get juzu => context.getRouteArguments<Juzu>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(juzu?.title?.toDisplay ?? ""),
        ),
        body: ListView.builder(
            padding: const EdgeInsets.all(8),
            itemCount: juzu?.items?.length,
            itemBuilder: (BuildContext context, int index) {
              JuzuItem? juzuItem = juzu?.items?[index];
              return SurahItem(
                onTap: () {
                  Navigator.pushNamed(context, kAyahDetailRoute,
                      arguments: AyahDetailArgs(
                          ayahs: juzuItem?.ayahs ?? [],
                          surahTitle: juzuItem?.surah?.title));
                },
                title: juzuItem?.surah?.title,
                number: juzuItem?.surah?.number.toString() ?? '',
                ayahs: juzuItem?.ayahs?.length ?? 0,
              );
            }));
  }
}
