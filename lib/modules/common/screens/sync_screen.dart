import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trading_app/common/constants/images.dart';
import 'package:trading_app/widgets/cached_image.dart';

import '../../../common/constants/routes.dart';
import '../../../configs/size_config.dart';
import '../../../di/injection.dart';
import '../../auth/bloc/auth_cubit.dart';
import '../../auth/bloc/auth_state.dart';

class SyncScreen extends StatefulWidget {
  const SyncScreen({Key? key}) : super(key: key);

  @override
  State<SyncScreen> createState() => _SyncScreenState();
}

class _SyncScreenState extends State<SyncScreen> {
  Size get size => MediaQuery.of(context).size;
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      AuthState state = getIt<AuthCubit>().state;
      _listener(context, state);
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: BlocListener<AuthCubit, AuthState>(
        listener: _listener,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Spacer(),
            Center(
              child: Column(
                children: [
                  CachedImage(
                    url: kLogo,
                    width: getProportionateScreenHeight(173),
                    height: getProportionateScreenHeight(173),
                  ),
                  SizedBox(height: getProportionateScreenHeight(40)),
                  Text(
                    "Coino",
                    style: Theme.of(context).textTheme.displayLarge,
                  ),
                ],
              ),
            ),
            const Spacer(),
            const CircularProgressIndicator(),
            SizedBox(height: getProportionateScreenHeight(100)),
          ],
        ),
      ),
    );
  }

  void _listener(context, AuthState state) {
    if (state.token?.isNotEmpty ?? false) {
      Navigator.of(context).pushReplacementNamed(kMainRoute);
    } else {
      Navigator.of(context).pushReplacementNamed(kOnboardingRoute);
    }
  }
}
