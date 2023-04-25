import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trading_app/common/enums/status.dart';
import 'package:trading_app/common/theme/colors.dart';
import 'package:trading_app/common/utils/toast.dart';
import 'package:trading_app/data/local/datasource/auth_local_datasource.dart';
import 'package:trading_app/generated/l10n.dart';
import 'package:trading_app/models/surah.dart';
import 'package:trading_app/modules/auth/bloc/auth_state.dart';
import 'package:trading_app/modules/ayah/screens/ayah_detail_screen.dart';
import 'package:trading_app/modules/home/bloc/home_cubit.dart';
import 'package:trading_app/modules/home/bloc/home_state.dart';
import '../../../common/constants/routes.dart';
import '../../../common/event/event_bus_event.dart';
import '../../../common/event/event_bus_mixin.dart';
import '../../../di/injection.dart';
import '../../../widgets/app_bar.dart';
import '../../../widgets/drawer.dart';
import '../../../widgets/list_content.dart';
import '../../../widgets/text_field.dart';
import '../../auth/bloc/auth_cubit.dart';
import '../widgets/surah_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with EventBusMixin {
  late StreamSubscription _streamSubscription;

  final GlobalKey<ScaffoldState> _key = GlobalKey();

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      context.read<AuthCubit>().getMyProfile();
      _streamSubscription =
          listenEvent<LogoutEvent>((LogoutEvent event) => _logout());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      key: _key,
      drawer: const DrawerApp(),
      appBar: AppBar(
        title: Text(S.of(context).home),
        leading: IconButton(
          onPressed: () {
            _key.currentState?.openDrawer();
          },
          icon: const Icon(CupertinoIcons.text_alignleft),
        ),
        actions: [
          BlocBuilder<AuthCubit, AuthState>(
              builder: (BuildContext context, AuthState state) {
            if (state.user?.lastReadAyah != null) {
              return IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, kAyahDetailRoute,
                      arguments: AyahDetailArgs(
                          ayahs: [state.user!.lastReadAyah!],
                          surahTitle: state.user?.lastReadAyah?.title));
                },
                icon: const Icon(CupertinoIcons.book),
              );
            } else {
              return const SizedBox();
            }
          }),
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, kSearchAyahsRoute);
            },
            icon: const Icon(CupertinoIcons.search),
          )
        ],
      ),
      body: BlocProvider(
        create: (BuildContext context) => getIt<HomeCubit>()..fetchItems(),
        child: BlocConsumer<HomeCubit, HomeState>(
          // listenWhen: (previous, current) =>(){};
          listener: (context, state) {
            if (state.status == RequestStatus.failed &&
                state.message?.isNotEmpty == true) {
              showErrorMessage(context, state.message!);
            }
          },
          builder: (BuildContext context, HomeState state) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  if (state.surahs?.isNotEmpty ?? false)
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: SearchTextField(onChanged: (String keyword) {
                        context.read<HomeCubit>().searchSurahs(keyword);
                      }),
                    ),
                  Expanded(
                    child: ListContent<Surah>(
                      list: (state.searchedSurahs?.isNotEmpty ?? false)
                          ? state.searchedSurahs
                          : state.surahs,
                      status: state.status,
                      errMsg: state.message,
                      onRefresh: () => _onRefresh(context),
                      onLoadMore: () => _onLoadMore(context),
                      itemBuilder: (Surah item) {
                        return SurahItem(
                          onTap: () {
                            Navigator.pushNamed(context, kAyahDetailRoute,
                                arguments: AyahDetailArgs(
                                    ayahs: item.ayahs ?? [],
                                    surahTitle: item.title));
                          },
                          title: item.title,
                          number: item.number.toString(),
                          ayahs: item.ayahs?.length ?? 0,
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  void _logout() {
    String? token = getIt<AuthLocalDatasource>().getLoggedInToken();
    if (token?.isNotEmpty ?? false) {
      context.read<AuthCubit>().logout();
      Navigator.of(context).pushReplacementNamed(kLoginRoute);
    }
  }

  @override
  void dispose() {
    _streamSubscription.cancel();
    super.dispose();
  }

  void _onLoadMore(BuildContext context) {}

  void _onRefresh(BuildContext context) {
    context.read<HomeCubit>().fetchItems();
  }
}
