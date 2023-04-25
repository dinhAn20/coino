import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:trading_app/common/event/event_bus_mixin.dart';
import 'package:trading_app/data/remote/auth/request_models/login_request.dart';
import 'package:trading_app/modules/auth/helpers/event_bus_event.dart';

import '../../../common/api_client/data_state.dart';
import '../../../common/enums/status.dart';
import '../../../data/local/datasource/auth_local_datasource.dart';
import '../../../data/remote/auth/request_models/register_request.dart';
import '../../../data/remote/auth/response_models/auth_response.dart';
import '../../../models/user.dart';
import '../../../repositories/auth_repository.dart';
import 'auth_state.dart';

@Singleton()
class AuthCubit extends Cubit<AuthState> with EventBusMixin {
  final AuthRepository _authRepository;
  final AuthLocalDatasource _authLocalDatasource;

  AuthCubit(
      {required AuthRepository authRepository,
      required AuthLocalDatasource authLocalDatasource})
      : _authRepository = authRepository,
        _authLocalDatasource = authLocalDatasource,
        super(const AuthState()) {
    listenEvent<ChangeProfileEvent>((event) {
      getMyProfile();
    });
  }

  Future<void> init() async {
    final String? token = _authLocalDatasource.getLoggedInToken();
    final User? userInfo = _authLocalDatasource.getLoggedInUser();
    if (token != null) {
      emit(state.copyWith(
          user: userInfo, token: token, loginStatus: RequestStatus.success));
    } else {
      emit(state.copyWith(loginStatus: RequestStatus.success));
    }
  }

  void setUserInfo(User userInfo){
    emit(state.copyWith(user: userInfo));
  }

  Future<void> login(String email, String password) async {
    try {
      emit(AuthState.initState()
          .copyWith(loginStatus: RequestStatus.requesting));
      final DataState<AuthResponse> result = await _authRepository
          .login(LoginRequest(email: email, password: password));
      if (result is DataSuccess) {
        emit(state.copyWith(
            loginStatus: RequestStatus.success,
            token: result.data?.token,
            user: result.data?.userInfo));
      } else {
        emit(state.copyWith(
            loginStatus: RequestStatus.failed, loginMessage: result.message));
      }
    } on Exception catch (e) {
      emit(state.copyWith(
          loginStatus: RequestStatus.failed, loginMessage: e.toString()));
    }
  }

  Future<void> register(
    String? name,
    String email,
    String password,
  ) async {
    try {
      emit(AuthState.initState()
          .copyWith(signUpStatus: RequestStatus.requesting));
      final DataState<AuthResponse> result = await _authRepository.register(
          RegisterRequest(name: name, email: email, password: password));
      if (result is DataSuccess) {
        emit(state.copyWith(
            token: result.data?.token,
            user: result.data?.userInfo,
            signUpStatus: RequestStatus.success));
      } else {
        emit(state.copyWith(
            signUpStatus: RequestStatus.failed, signUpMessage: result.message));
      }
    } on Exception catch (e) {
      emit(state.copyWith(
          signUpStatus: RequestStatus.failed, signUpMessage: e.toString()));
    }
  }

  Future<void> logout() async {
    try {
      await _authRepository.logout();
      emit(const AuthState());
    } on Exception catch (_) {}
  }

  Future<void> getMyProfile() async {
    try {
      final DataState<User> result = await _authRepository.getMyProfile();
      if (result is DataSuccess) {
        emit(state.copyWith(user: result.data));
      }
    } on Exception catch (_) {}
  }

  Future<void> forgotPassword(String email) async {
    try {
      emit(state.copyWith(forgotPassStatus: RequestStatus.requesting));
      final DataState result =
          await _authRepository.forgotPassword(email);
      if (result is DataSuccess) {
        emit(state.copyWith(
          forgotPassStatus: RequestStatus.success,
        ));
      } else {
        emit(state.copyWith(
            forgotPassStatus: RequestStatus.failed,
            forgotPassMessage: result.message));
      }
    } on Exception catch (e) {
      emit(state.copyWith(
          forgotPassStatus: RequestStatus.failed,
          forgotPassMessage: e.toString()));
    }
  }
}
