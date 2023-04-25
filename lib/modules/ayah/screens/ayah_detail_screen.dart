import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trading_app/common/utils/extensions/build_context_extension.dart';
import 'package:trading_app/data/remote/auth/request_models/update_profile_request.dart';
import 'package:trading_app/di/injection.dart';
import 'package:trading_app/models/ayah.dart';
import 'package:trading_app/models/multi_text.dart';
import 'package:trading_app/models/user.dart';
import 'package:trading_app/modules/ayah/screens/ayahs_screen.dart';
import '../../../common/api_client/data_state.dart';
import '../../../common/event/event_bus_event.dart';
import '../../../repositories/auth_repository.dart';
import '../../../widgets/multi_language_text.dart';
import '../../auth/bloc/auth_cubit.dart';
import '../../my_profile/bloc/edit_profile_cubit.dart';
import '../bloc/search_ayahs_cubit.dart';
import '../widgets/ayah_detail_item.dart';

class AyahDetailArgs {
  const AyahDetailArgs({required this.ayahs, this.surahTitle});
  final List<Ayah> ayahs;
  final MultiText? surahTitle;
}

class AyahDetailScreen extends StatefulWidget {
  const AyahDetailScreen({Key? key}) : super(key: key);
  @override
  State<AyahDetailScreen> createState() => _AyahDetailScreenState();
}

class _AyahDetailScreenState extends State<AyahDetailScreen> {
  int _currentIndex = 0;

  AyahDetailArgs? get _args => context.getRouteArguments<AyahDetailArgs>();

  User? get user => context.read<AuthCubit>().state.user;
  final PageController _controller = PageController();

  @override
  void initState() {
    Future.delayed(Duration.zero, () {
      _updateLastReadAyah(context, _args?.ayahs[_currentIndex]);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: MultiLanguageText(
            _args?.surahTitle,
            space: 0,
          ),
          actions: (_args?.ayahs.length ?? 0) > 1
              ? [
                  IconButton(
                      onPressed: () {
                        _showAyahs();
                      },
                      icon: const Icon(CupertinoIcons.list_bullet))
                ]
              : null,
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Stack(
              children: [
                PageView(
                  onPageChanged: _onChangePage,
                  controller: _controller,
                  children: <Widget>[
                    ...?_args?.ayahs
                        .map((e) => AyahDetailItem(ayah: e))
                        .toList()
                  ],
                ),
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _currentIndex != 0
                          ? Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25),
                                  color: Theme.of(context).primaryColor),
                              child: IconButton(
                                onPressed: () {
                                  _controller.previousPage(
                                      duration:
                                          const Duration(microseconds: 300),
                                      curve: Curves.easeIn);
                                },
                                icon: const Icon(
                                  Icons.keyboard_arrow_left,
                                  color: Colors.white,
                                ),
                              ),
                            )
                          : const SizedBox(),
                      if (_currentIndex + 1 < (_args?.ayahs.length ?? 0))
                        Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              color: Theme.of(context).primaryColor),
                          child: IconButton(
                            onPressed: () {
                              _controller.nextPage(
                                  duration: const Duration(microseconds: 300),
                                  curve: Curves.easeIn);
                            },
                            icon: const Icon(
                              Icons.keyboard_arrow_right,
                              color: Colors.white,
                            ),
                          ),
                        )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  Future _showAyahs() async {
    Ayah? selectedAyah = await Navigator.push(context,
        MaterialPageRoute(builder: (context) => AyahsScreen(args: _args)));
    for (int index = 0; index < (_args?.ayahs.length ?? 0); index++) {
      if (selectedAyah == _args?.ayahs[index]) {
        _controller.animateToPage(index,
            duration: const Duration(milliseconds: 200), curve: Curves.easeIn);
        break;
      }
    }
  }

  void _onChangePage(int currentIndex) {
    setState(() {
      _currentIndex = currentIndex;
    });
    _updateLastReadAyah(context, _args?.ayahs[currentIndex]);
  }

  Future _updateLastReadAyah(BuildContext context, Ayah? ayah) async {
    if (user != null) {
      try {
        final DataState<User?> result = await getIt<AuthRepository>()
            .editProfile(UpdateProfileRequest(lastReadAyah: ayah?.id));
        if (result.data != null) {
          context.read<AuthCubit>().setUserInfo(result.data!);
        }
      } on Exception catch (_) {}
    }
  }
}
