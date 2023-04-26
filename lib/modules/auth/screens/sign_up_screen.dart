import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trading_app/common/theme/colors.dart';
import 'package:trading_app/common/utils/toast.dart';
import 'package:trading_app/modules/auth/bloc/auth_cubit.dart';

import '../../../common/constants/routes.dart';
import '../../../common/enums/status.dart';
import '../../../widgets/button.dart';
import '../bloc/auth_state.dart';
import '../widgets/sign_up_tabs.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  SignUpTab _currentTab = SignUpTab.name;

  void _onChangedTab({bool isDecrease = false}) {
    if (!isDecrease) {
      _currentTab =
          SignUpTab.values[(_currentTab.index + 1) % SignUpTab.values.length];
    } else {
      _currentTab = SignUpTab.values[
          (_currentTab.index - 1 + SignUpTab.values.length) %
              SignUpTab.values.length];
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: (_currentTab == SignUpTab.congratulations ||
                _currentTab == SignUpTab.setPINCode)
            ? null
            : ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: LinearProgressIndicator(
                  minHeight: 10,
                  backgroundColor: kGray200,
                  value: _currentTab.progressVal,
                ),
              ),
        leading: IconButton(
            onPressed: () {
              _currentTab.index == 0
                  ? Navigator.pop(context)
                  : _onChangedTab(isDecrease: true);
            },
            icon: const Icon(Icons.arrow_back_rounded)),
        leadingWidth: 56,
        actions: const [
          SizedBox(width: 56),
        ],
      ),
      body: BlocConsumer<AuthCubit, AuthState>(
        listenWhen: (AuthState prev, AuthState current) =>
            prev.signUpStatus != current.signUpStatus,
        listener: (context, AuthState state) {
          if (state.signUpStatus == RequestStatus.failed &&
              (state.signUpMessage?.isNotEmpty ?? false)) {
            showErrorMessage(context, state.signUpMessage!);
          } else if (state.signUpStatus == RequestStatus.success &&
              (state.token?.isNotEmpty ?? false)) {
            Navigator.of(context).pushNamed(kMainRoute);
          }
        },
        builder: (context, AuthState state) {
          return Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              children: [
                Expanded(
                    child: SignUpTabs(signUpTab: _currentTab)),
                const SizedBox(height: 32),
                BasicButton(
                  label: "Continue",
                  onPressed: () => _onChangedTab(),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}

