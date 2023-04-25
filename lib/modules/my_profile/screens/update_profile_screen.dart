import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:trading_app/common/theme/colors.dart';
import 'package:trading_app/common/utils/toast.dart';
import 'package:trading_app/data/remote/auth/request_models/update_profile_request.dart';
import 'package:trading_app/modules/auth/bloc/auth_cubit.dart';
import 'package:trading_app/modules/my_profile/bloc/edit_profile_cubit.dart';
import 'package:trading_app/modules/my_profile/bloc/edit_profile_state.dart';
import 'package:trading_app/widgets/text_field.dart';

import '../../../common/enums/status.dart';
import '../../../di/injection.dart';
import '../../../generated/l10n.dart';
import '../../../models/user.dart';
import '../../../widgets/button.dart';
import '../../../widgets/upload_image_profile.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _nameController = TextEditingController()
    ..text = _user?.name ?? '';
  late final TextEditingController _emailController = TextEditingController()
    ..text = _user?.email ?? '';

  User? get _user => context.read<AuthCubit>().state.user;
  XFile? _file;
  bool _isShowImageFile = false;
  UpdateProfileRequest updateProfileRequest = UpdateProfileRequest.empty();

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            centerTitle: true,
            title: Text(
              S.of(context).editProfile,
            ),
          ),
          body: BlocProvider(
            create: (_) => getIt<EditProfileCubit>()..init(_user),
            child: BlocConsumer<EditProfileCubit, EditProfileState>(
              listenWhen:
                  (EditProfileState previous, EditProfileState current) =>
                      previous.status != current.status,
              listener: (context, EditProfileState state) {
                if (state.status == RequestStatus.failed &&
                    state.message?.isNotEmpty == true) {
                  showErrorMessage(context, state.message!);
                }
                if (state.status == RequestStatus.success) {
                  showSuccessMessage(
                      context, S.of(context).updateProfileSuccessfully);
                  Navigator.of(context).pop();
                }
              },
              builder: (context, EditProfileState state) {
                return SafeArea(
                  child: SingleChildScrollView(
                    keyboardDismissBehavior:
                        ScrollViewKeyboardDismissBehavior.onDrag,
                    child: Form(
                      key: _formKey,
                      child: Container(
                        constraints: const BoxConstraints(maxWidth: 400),
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 20),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                UploadImageProfile(
                                  file: state.user?.avatar,
                                  isShowImageFile: _isShowImageFile,
                                  xFile: _file,
                                  onChanged: (XFile? file) {
                                    if (file != null) {
                                      setState(() {
                                        _file = file;
                                        _isShowImageFile = true;
                                      });
                                      context.read<EditProfileCubit>().uploadFile(_file!);
                                    }
                                  },
                                ),
                              ],
                            ),
                            const SizedBox(height: 15),
                            BasicTextField(
                              hintStyle: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(color: kGreyColor),
                              label: S.current.name,
                              controller: _nameController,
                            ),
                            const SizedBox(height: 15),
                            BasicTextField(
                              readOnly: true,
                              hintStyle: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(color: kGreyColor),
                              label: S.current.email,
                              controller: _emailController,
                            ),
                            const SizedBox(height: 10),
                            BasicButton(
                                width: double.infinity,
                                onPressed: () {
                                  _submitEdit(context,
                                  _nameController.text,
                                  state.file?.url??"");
                                },
                                label: S.of(context).editProfile,
                                isLoading:
                                    state.status == RequestStatus.requesting),
                            const SizedBox(height: 10),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          )),
    );
  }

  void _submitEdit(BuildContext context, String name, String avatar) async {
    if (_formKey.currentState!.validate()) {
      await context
          .read<EditProfileCubit>()
          .editProfile(updateProfileRequest.copyWith(
            avatar: avatar,
            name: name,
          ));
    }
  }
}
