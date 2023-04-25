import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trading_app/common/constants/routes.dart';
import 'package:trading_app/generated/l10n.dart';
import 'package:trading_app/modules/auth/bloc/auth_cubit.dart';
import 'package:trading_app/modules/auth/bloc/auth_state.dart';
import '../../../common/constants/images.dart';
import '../../../common/theme/colors.dart';
import '../../../widgets/cached_image.dart';

class MyProfileScreen extends StatefulWidget {
  const MyProfileScreen({Key? key}) : super(key: key);

  @override
  State<MyProfileScreen> createState() => _MyProfileScreenState();
}

class _MyProfileScreenState extends State<MyProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).myProfile),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(kSettingsRoute);
              },
              icon: const Icon(
                CupertinoIcons.settings,
                color: kWhiteColor,
              ))
        ],
      ),
      body: BlocBuilder<AuthCubit, AuthState>(
          builder: (BuildContext context, AuthState state) {
        return SafeArea(
          child: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(15),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CachedImage(
                      url: state.user?.avatar ?? kDefaultImage,
                      height: 100,
                      width: 100,
                      radius: 50,
                      fit: BoxFit.cover,
                    ),
                    const SizedBox(height: 20),
                    MyProfileItem(
                        label: S.of(context).name, value: state.user?.name),
                    MyProfileItem(
                        label: S.of(context).email, value: state.user?.email),
                  ]),
            ),
          ),
        );
      }),
    );
  }

}

class MyProfileItem extends StatelessWidget {
  const MyProfileItem({
    super.key,
    required this.label,
    required this.value,
    this.onTap,
    this.isSocialLink = false,
  });
  final String label;
  final String? value;
  final bool isSocialLink;
  final Function(String)? onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15),
      decoration: const BoxDecoration(
          border: Border(bottom: BorderSide(color: kLightGreyColor))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
              flex: 2,
              child: Text(
                label,
                style: Theme.of(context)
                    .textTheme
                    .labelLarge
                    ?.copyWith(fontWeight: FontWeight.w500),
              )),
          const SizedBox(width: 8),
          if (value != null)
            Expanded(
                flex: 3,
                child: GestureDetector(
                  onTap: () {
                    if (isSocialLink) onTap?.call(value!);
                  },
                  child: Text(value!,
                      style: Theme.of(context).textTheme.labelMedium?.copyWith(
                          fontWeight: FontWeight.w300,
                          color: isSocialLink ? Colors.blue : null)),
                ))
        ],
      ),
    );
  }
}
