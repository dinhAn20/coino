import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trading_app/configs/language_config.dart';
import 'package:trading_app/generated/l10n.dart';
import 'package:trading_app/modules/common/bloc/app_state.dart';
import 'package:trading_app/modules/language/widgets/language_item.dart';
import '../../../widgets/app_bar.dart';
import '../../../widgets/drawer.dart';
import '../../common/bloc/app_cubit.dart';

class LanguageScreen extends StatefulWidget {
  const LanguageScreen({Key? key}) : super(key: key);

  @override
  State<LanguageScreen> createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) => Scaffold(
          drawer: const DrawerApp(),
          appBar: AppBarUI(title: S.of(context).language, isEnableDrawer: true)
              .build(context),
          body: ListView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: LanguageConfig.kSupportedLanguages.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () {
                    context.read<AppCubit>().changeLanguage(
                        LanguageConfig.kSupportedLanguages[index]["code"]);
                  },
                  child: LanguageItem(
                      isCurrentLanguage: state.langCode ==
                          LanguageConfig.kSupportedLanguages[index]["code"],
                      flag: LanguageConfig.kSupportedLanguages[index]["icon"],
                      name: LanguageConfig.kSupportedLanguages[index]["text"]),
                );
              })),
    );
  }
}
