import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trading_app/common/constants/routes.dart';
import 'package:trading_app/common/event/event_bus_mixin.dart';
import 'package:trading_app/generated/l10n.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:trading_app/widgets/button.dart';

import '../common/constants/images.dart';
import '../common/event/event_bus_event.dart';
import '../modules/auth/bloc/auth_cubit.dart';
import '../modules/auth/bloc/auth_state.dart';
import 'cached_image.dart';

class DrawerApp extends StatefulWidget {
  const DrawerApp({Key? key}) : super(key: key);

  @override
  State<DrawerApp> createState() => _DrawerAppState();
}

class _DrawerAppState extends State<DrawerApp> with EventBusMixin {
  final Uri _url = Uri.parse('mailto:info.quranitukufu@gmail.com');

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
        builder: (BuildContext context, AuthState state) {
      return Drawer(
        child: Column(
          children: [
            if (state.user != null)
              DrawerHeader(
                child: Row(
                  children: [
                    CachedImage(
                      url: state.user?.avatar ?? kDefaultImage,
                      fit: BoxFit.cover,
                      width: 80,
                      height: 80,
                      radius: 40,
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            state.user?.name ?? state.user?.email ?? 'No Name',
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context)
                                .textTheme
                                .labelMedium
                                ?.copyWith(fontWeight: FontWeight.w900),
                          ),
                          const SizedBox(height: 5),
                          GestureDetector(
                            onTap: () {
                              Navigator.popAndPushNamed(
                                  context, kMyProfileRoute);
                            },
                            child: Text(
                              S.of(context).viewMyProfile,
                              maxLines: 1,
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            if (state.user == null)
              DrawerHeader(
                  child: Row(
                children: [
                  Expanded(
                      child: BasicButton(
                    label: S.of(context).login,
                    onPressed: () {
                      Navigator.of(context).popAndPushNamed(kSignInRoute);
                    },
                  )),
                ],
              )),
            ListTile(
              leading: Icon(
                CupertinoIcons.home,
                color: Theme.of(context).primaryColor,
                size: 24,
              ),
              horizontalTitleGap: 0.0,
              title: Text(S.of(context).home,
                  style: Theme.of(context).textTheme.labelMedium),
              onTap: () {
                Navigator.popAndPushNamed(context, kMainRoute);
              },
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.globe,
                color: Theme.of(context).primaryColor,
                size: 24,
              ),
              horizontalTitleGap: 0.0,
              title: Text(S.of(context).language,
                  style: Theme.of(context).textTheme.labelMedium),
              onTap: () {
                Navigator.popAndPushNamed(context, kLanguageRoute);
              },
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.bookmark,
                color: Theme.of(context).primaryColor,
                size: 24,
              ),
              horizontalTitleGap: 0.0,
              title: Text(S.of(context).juzu,
                  style: Theme.of(context).textTheme.labelMedium),
              onTap: () {
                Navigator.popAndPushNamed(context, kJuZuRoute);
              },
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.book_fill,
                color: Theme.of(context).primaryColor,
                size: 24,
              ),
              horizontalTitleGap: 0.0,
              title: Text(S.of(context).book,
                  style: Theme.of(context).textTheme.labelMedium),
              onTap: () {
                Navigator.popAndPushNamed(context, kBookRoute);
              },
            ),
            ListTile(
                leading: Icon(
                  CupertinoIcons.location,
                  color: Theme.of(context).primaryColor,
                  size: 24,
                ),
                horizontalTitleGap: 0.0,
                title: Text(S.of(context).contactUs,
                    style: Theme.of(context).textTheme.labelMedium),
                onTap: () {
                  _launchUrl();
                }),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () {
                  shareEvent(LogoutEvent());
                },
                child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Theme.of(context).primaryColor.withOpacity(0.2)),
                    padding: const EdgeInsets.symmetric(
                        vertical: 12, horizontal: 16),
                    child: Center(
                        child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.logout,
                          color: Colors.black,
                        ),
                        const SizedBox(width: 10),
                        Text(
                          S.of(context).logout,
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ],
                    ))),
              ),
            ),
            const SizedBox(height: 20)
          ],
        ),
      );
    });
  }

  Future<void> _launchUrl() async {
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }
}
