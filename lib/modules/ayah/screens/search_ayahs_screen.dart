import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trading_app/common/utils/extensions/build_context_extension.dart';
import 'package:trading_app/di/injection.dart';
import 'package:trading_app/models/ayah.dart';
import 'package:trading_app/modules/ayah/bloc/search_ayahs_cubit.dart';
import 'package:trading_app/modules/ayah/bloc/search_ayahs_state.dart';
import '../../../common/constants/routes.dart';
import '../../../widgets/multi_language_text.dart';
import '../../../widgets/text_field.dart';
import '../widgets/ayah_item.dart';
import 'ayah_detail_screen.dart';

class SearchAyahsScreen extends StatefulWidget {
  const SearchAyahsScreen({Key? key}) : super(key: key);

  @override
  State<SearchAyahsScreen> createState() => _AyahsScreenState();
}

class _AyahsScreenState extends State<SearchAyahsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: AppBar(),
        body: BlocProvider(
          create: (_) => getIt<SearchAyahsCubit>()..fetchItems(),
          child: BlocBuilder<SearchAyahsCubit, SearchAyahsState>(
            builder: (BuildContext context, SearchAyahsState state) {
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 10),
                    child: SearchTextField(onChanged: (String keyword) {
                      context.read<SearchAyahsCubit>().searchItems(keyword);
                    }),
                  ),
                  Expanded(
                      child: ListView.builder(
                          padding: const EdgeInsets.all(10),
                          itemCount: state.ayahs?.length,
                          itemBuilder: (BuildContext context, int index) {
                            Ayah? ayah = state.ayahs?[index];
                            return GestureDetector(
                              behavior: HitTestBehavior.opaque,
                              onTap: () {
                                Navigator.pushNamed(context, kAyahDetailRoute,
                                    arguments: AyahDetailArgs(
                                        ayahs: ayah != null ? [ayah] : [],
                                        surahTitle: ayah?.title));
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 20),
                                child: AyahItem(ayah: ayah),
                              ),
                            );
                          }))
                ],
              );
            },
          ),
        ));
  }
}
