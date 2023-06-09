import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:trading_app/common/constants/routes.dart';
import 'package:trading_app/common/event/event_bus_mixin.dart';
import 'package:trading_app/common/utils/navigator_utils.dart';
import 'package:trading_app/crypto_detail/screens/crypto_detail_screen.dart';
import 'package:trading_app/modules/auth/screens/forgot_password_screen.dart';
import 'package:trading_app/modules/auth/screens/sign_up_screen.dart';
import 'package:trading_app/modules/common/bloc/app_cubit.dart';
import 'package:trading_app/modules/common/screens/webview_screen.dart';
import 'package:trading_app/modules/home/screens/home_screen.dart';
import 'package:trading_app/modules/language/screens/language_screen.dart';
import 'package:trading_app/modules/my_profile/screens/change_password_screen.dart';
import 'package:trading_app/modules/my_profile/screens/update_profile_screen.dart';

import '../common/theme/index.dart';
import '../crypto_search/screens/search_screen.dart';
import '../di/injection.dart';
import '../generated/l10n.dart';
import 'auth/bloc/auth_cubit.dart';
import 'auth/screens/input_code_screen.dart';
import 'auth/screens/set_pin_code_screen.dart';
import 'auth/screens/sign_in_screen.dart';
import 'common/screens/sync_screen.dart';
import 'my_profile/screens/my_profile_screen.dart';
import 'my_profile/screens/my_profile_settings_screen.dart';
import 'notifications/screens/notification_screen.dart';
import 'onboarding/screens/onboarding_screen.dart';

class App extends StatefulWidget with EventBusMixin {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthCubit>(
          lazy: false,
          create: (_) => getIt<AuthCubit>()..init(),
        ),
        BlocProvider<AppCubit>(
          create: (_) => getIt<AppCubit>(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        locale: const Locale("en"),
        localizationsDelegates: const [
          S.delegate,
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
        themeMode: ThemeMode.light,
        theme: ThemeApp.lightTheme,
        darkTheme: ThemeApp.darkTheme,
        initialRoute: kMainRoute,
        navigatorKey: NavigatorUtils.instance.navigatorKey,
        routes: {
          kMainRoute: (context) => const HomeScreen(),
          kOnboardingRoute: (context) => const OnboaringScreen(),
          kSyncRoute: (context) => const SyncScreen(),
          kSignInRoute: (context) => const SignInScreen(),
          kSetPinCodeRoute: (context) => const SetPinCodeScreen(),
          kInputCodeRoute: (context) => const InputCodeScreen(),
          kSignUpRoute: (context) => const SignUpScreen(),
          kForgotPasswordRoute: (context) => const ForgotPasswordScreen(),
          kWebViewRoute: (context) => const WebViewScreen(),
          kNotificationRoute: (context) => const NotificationScreen(),
          kSearchRoute: (context) => const SearchScreen(),
          kCryptoDetailRoute: (context) => const CryptoDetailScreen(),
          kChangePasswordRoute: (context) => const ChangePasswordScreen(),
          kSettingsRoute: (context) => const SettingsScreen(),
          kEditProfileRoute: (context) => const EditProfileScreen(),
          kMyProfileRoute: (context) => const MyProfileScreen(),
          kLanguageRoute: (context) => const LanguageScreen(),
        },
      ),
    );
  }
}
