import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_compression_flutter/image_compression_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:trading_app/common/event/event_bus_mixin.dart';
import 'package:trading_app/models/avatar.dart';
import 'package:trading_app/modules/auth/helpers/event_bus_event.dart';
import 'package:trading_app/repositories/auth_repository.dart';

import '../../../common/api_client/data_state.dart';
import '../../../common/enums/status.dart';
import '../../../data/remote/auth/request_models/update_profile_request.dart';
import '../../../models/user.dart';
import 'edit_profile_state.dart';

@Injectable()
class EditProfileCubit extends Cubit<EditProfileState> with EventBusMixin {
  late final AuthRepository _authRepository;

  EditProfileCubit({required AuthRepository authRepository})
      : super(const EditProfileState()) {
    _authRepository = authRepository;
  }

  void init(User? user) {
    emit(state.copyWith(user: user));
  }

  Future<void> editProfile(UpdateProfileRequest request) async {
    try {
      emit(state.copyWith(status: RequestStatus.requesting));
      final DataState<User?> result = await _authRepository.editProfile(request);
      if (result is DataSuccess) {
        shareEvent(ChangeProfileEvent());
        emit(state.copyWith(status: RequestStatus.success));
      } else {
        emit(state.copyWith(
            status: RequestStatus.failed, message: result.message));
      }
    } on Exception catch (e) {
      emit(state.copyWith(status: RequestStatus.failed, message: e.toString()));
    }
  }
  Future<void> uploadFile(XFile file) async {
    try {
      final DataState<Avatar?> result = await _authRepository.uploadFile(file);
      if (result is DataSuccess) {
        emit(state.copyWith(file: result.data));
      } else {
        emit(state.copyWith(
            status: RequestStatus.failed, message: result.message));
      }
    } on Exception catch (e) {
      emit(state.copyWith(status: RequestStatus.failed, message: e.toString()));
    }
  }
}
