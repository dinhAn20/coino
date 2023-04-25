import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trading_app/data/local/datasource/auth_local_datasource.dart';
import 'package:trading_app/generated/l10n.dart';
import 'package:trading_app/modules/auth/bloc/auth_state.dart';
import '../../../common/constants/routes.dart';
import '../../../common/event/event_bus_event.dart';
import '../../../common/event/event_bus_mixin.dart';
import '../../../di/injection.dart';
import '../../../widgets/drawer.dart';
import '../../auth/bloc/auth_cubit.dart';

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
      body: Container()
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
}
