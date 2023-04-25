import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trading_app/generated/l10n.dart';
import 'package:trading_app/modules/auth/bloc/auth_cubit.dart';
import '../../../common/constants/routes.dart';
import '../../auth/bloc/auth_state.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(S.of(context).settings),
        ),
        body: BlocBuilder<AuthCubit, AuthState>(
          builder: (context, state) => SingleChildScrollView(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Card(
                    child: ListTile(
                        onTap: () =>
                            Navigator.of(context).pushNamed(kEditProfileRoute),
                        title: Text(
                          S.of(context).editProfile,
                          style: Theme.of(context)
                              .textTheme
                              .labelMedium
                              ?.copyWith(fontWeight: FontWeight.w500),
                        ),
                        trailing: const Icon(
                          Icons.arrow_forward_ios_rounded,
                          size: 16,
                        )),
                  ),
                  Card(
                    child: ListTile(
                        onTap: () => Navigator.of(context)
                            .pushNamed(kChangePasswordRoute),
                        title: Text(
                          S.of(context).changePassword,
                          style: Theme.of(context)
                              .textTheme
                              .labelMedium
                              ?.copyWith(fontWeight: FontWeight.w500),
                        ),
                        trailing: const Icon(
                          Icons.arrow_forward_ios_rounded,
                          size: 16,
                        )),
                  ),
                ]),
          ),
        ));
  }
}
