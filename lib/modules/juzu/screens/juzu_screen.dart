import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trading_app/common/constants/routes.dart';
import 'package:trading_app/generated/l10n.dart';
import 'package:trading_app/modules/juzu/bloc/juzu_cubit.dart';
import 'package:trading_app/modules/juzu/bloc/juzu_state.dart';
import '../../../common/enums/status.dart';
import '../../../common/utils/toast.dart';
import '../../../di/injection.dart';
import '../../../models/juzu.dart';
import '../../../widgets/list_content.dart';
import '../../home/widgets/surah_item.dart';

class JuzuScreen extends StatefulWidget {
  const JuzuScreen({Key? key}) : super(key: key);

  @override
  State<JuzuScreen> createState() => _JuzuScreenState();
}

class _JuzuScreenState extends State<JuzuScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).juZu),
      ),
      body: BlocProvider(
        create: (BuildContext context) => getIt<JuzuCubit>()..fetchItems(),
        child: BlocConsumer<JuzuCubit, JuzuState>(
          // // listenWhen: (previous, current) =>(){};
          listener: (context, state) {
            if (state.status == RequestStatus.failed &&
                state.message?.isNotEmpty == true) {
              showErrorMessage(context, state.message!);
            }
          },
          builder: (BuildContext context, JuzuState state) {
            return Column(
              children: [
                Expanded(
                  child: ListContent<Juzu>(
                    list: state.juzus,
                    status: state.status,
                    errMsg: state.message,
                    onRefresh: () => _onRefresh(context),
                    onLoadMore: () => _onLoadMore(context),
                    itemBuilder: (Juzu juzu) {
                      return SurahItem(
                        onTap: () {
                          Navigator.pushNamed(context, kJuzuDetailRoute,
                              arguments: juzu);
                        },
                        title: juzu.title,
                        number: juzu.number.toString(),
                        ayahs: juzu.items?.length ?? 0,
                      );
                    },
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  void _onLoadMore(BuildContext context) {}

  void _onRefresh(BuildContext context) {
    context.read<JuzuCubit>().fetchItems();
  }
}
