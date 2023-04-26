import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trading_app/common/utils/toast.dart';
import 'package:trading_app/configs/size_config.dart';
import 'package:trading_app/modules/auth/bloc/auth_cubit.dart';
import 'package:trading_app/modules/auth/widgets/title_with_subtitle_text.dart';
import 'package:trading_app/widgets/text_field.dart';

import '../../../common/constants/routes.dart';
import '../../../common/enums/status.dart';
import '../../../widgets/button.dart';
import '../bloc/auth_state.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocConsumer<AuthCubit, AuthState>(
        listenWhen: (AuthState prev, AuthState current) =>
            prev.loginStatus != current.loginStatus,
        listener: (context, AuthState state) {
          if (state.loginStatus == RequestStatus.failed &&
              (state.loginMessage?.isNotEmpty ?? false)) {
            showErrorMessage(context, state.loginMessage!);
          } else if (state.loginStatus == RequestStatus.success &&
              (state.token?.isNotEmpty ?? false)) {
            Navigator.of(context).pushNamed(kMainRoute);
          }
        },
        builder: (context, AuthState state) {
          return Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const TitleWithSubtitleText(
                        title: "Hello there 👋",
                        subTitle:
                            "Please enter your account email address. We will send an OTP code for verification in the next step.",
                      ),
                      SizedBox(
                        height: getProportionateScreenHeight(32),
                      ),
                      BasicTextField(
                        label: "Email",
                        controller: _emailController,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 32),
                BasicButton(
                  label: "Continue",
                  onPressed: () =>
                      Navigator.pushNamed(context, kInputCodeRoute),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
