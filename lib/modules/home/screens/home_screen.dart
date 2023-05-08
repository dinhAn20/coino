import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trading_app/common/utils/extensions/string_extension.dart';
import 'package:trading_app/common/utils/extensions/text_style_extension.dart';
import 'package:trading_app/data/local/datasource/auth_local_datasource.dart';
import 'package:trading_app/widgets/cached_image.dart';
import '../../../common/constants/images.dart';
import '../../../common/constants/routes.dart';
import '../../../common/event/event_bus_event.dart';
import '../../../common/event/event_bus_mixin.dart';
import '../../../common/theme/colors.dart';
import '../../../di/injection.dart';
import '../../auth/bloc/auth_cubit.dart';
import '../widgets/graph_item.dart';
import '../widgets/ranking_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with EventBusMixin {
  late StreamSubscription _streamSubscription;
  int _selectedIndex = 0;

  final GlobalKey<ScaffoldState> _key = GlobalKey();

  Size get size => MediaQuery.of(context).size;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      // context.read<AuthCubit>().getMyProfile();
      _streamSubscription =
          listenEvent<LogoutEvent>((LogoutEvent event) => _logout());
    });
  }

  @override
  void dispose() {
    _streamSubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              title: const Text("Coino"),
              centerTitle: false,
              leading: const Padding(
                padding: EdgeInsets.only(left: 24),
                child: CachedImage(url: kLogo),
              ),
              actions: [
                GestureDetector(
                    onTap: () => Navigator.pushNamed(context, kSearchRoute),
                    child: kSearchIcon.toSvg(
                        height: 28,
                        width: 28,
                        color: Theme.of(context)
                            .appBarTheme
                            .actionsIconTheme
                            ?.color)),
                const SizedBox(width: 20),
                GestureDetector(
                    onTap: () {},
                    child: kScanIcon.toSvg(
                        height: 28,
                        width: 28,
                        color: Theme.of(context)
                            .appBarTheme
                            .actionsIconTheme
                            ?.color)),
                const SizedBox(width: 20),
                GestureDetector(
                    onTap: () =>
                        Navigator.pushNamed(context, kNotificationRoute),
                    child: kNotificationIcon.toSvg(
                        height: 28,
                        width: 28,
                        color: Theme.of(context)
                            .appBarTheme
                            .actionsIconTheme
                            ?.color)),
                const SizedBox(width: 24),
              ],
              leadingWidth: 50,
              pinned: false,
            ),
          ];
        },
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              Container(
                height: size.width * 0.56,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient: LinearGradient(
                        begin: const Alignment(0, -0.5),
                        end: Alignment.bottomCenter,
                        colors: [
                          kDark1Color.withOpacity(0),
                          kDark1Color.withOpacity(0.8),
                        ]),
                    image: const DecorationImage(
                        image: AssetImage(kCongratulationsImage))),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "How to invest in cryptocurrencies 🚀",
                          style:
                              Theme.of(context).textTheme.headlineSmall!.white,
                        ),
                        const SizedBox(height: 6),
                        Text("Learn from the experts from A to Z right now!",
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .white
                                .w500),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              SizedBox(
                height: 150,
                child: ListView.builder(
                  itemCount: 5,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => const GraphItem(),
                ),
              ),
              const RankingList(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  BottomNavigationBar _buildBottomNavigationBar() {
    final Color? selectedColor =
        Theme.of(context).bottomNavigationBarTheme.selectedIconTheme?.color;
    final Color? unselectedColor =
        Theme.of(context).bottomNavigationBarTheme.unselectedIconTheme?.color;
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      currentIndex: _selectedIndex,
      onTap: (value) {
        setState(() {
          _selectedIndex = value;
        });
      },
      items: [
        BottomNavigationBarItem(
            activeIcon: kHomeFill.toSvg(color: selectedColor),
            icon: kHome.toSvg(color: unselectedColor),
            label: "Home"),
        BottomNavigationBarItem(
            activeIcon: kActivityFill.toSvg(color: selectedColor),
            icon: kActivity.toSvg(color: unselectedColor),
            label: "Market"),
        BottomNavigationBarItem(
            activeIcon: kPaperFill.toSvg(color: selectedColor),
            icon: kPaper.toSvg(color: unselectedColor),
            label: "Orders"),
        BottomNavigationBarItem(
            activeIcon: kWalletFill.toSvg(color: selectedColor),
            icon: kWallet.toSvg(color: unselectedColor),
            label: "Wallet"),
        BottomNavigationBarItem(
          activeIcon: kProfileFill.toSvg(color: selectedColor),
          icon: kProfile.toSvg(color: unselectedColor),
          label: "Account",
        ),
      ],
    );
  }

  void _logout() {
    String? token = getIt<AuthLocalDatasource>().getLoggedInToken();
    if (token?.isNotEmpty ?? false) {
      context.read<AuthCubit>().logout();
      Navigator.of(context).pushReplacementNamed(kSignInRoute);
    }
  }
}
