import 'package:image_compression_flutter/image_compression_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:trading_app/models/avatar.dart';

import '../common/api_client/data_state.dart';
import '../data/local/datasource/auth_local_datasource.dart';
import '../data/remote/auth/auth_service.dart';
import '../data/remote/auth/request_models/login_request.dart';
import '../data/remote/auth/request_models/register_request.dart';
import '../data/remote/auth/request_models/update_profile_request.dart';
import '../data/remote/auth/response_models/auth_response.dart';
import '../models/user.dart';

abstract class AuthRepository {
  Future<DataState<AuthResponse>> login(LoginRequest request);
  Future<DataState<AuthResponse>> register(RegisterRequest request);
  Future<DataState> forgotPassword(String email);
  Future<DataState<User>> editProfile(UpdateProfileRequest request);
  Future<DataState<User>> getMyProfile();
  Future<void> logout();
  Future<DataState<String?>> changePassword(String currentPass, String newPass);
  Future<DataState<Avatar?>> uploadFile(XFile file);
}

@LazySingleton(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  final AuthService _authService;
  final AuthLocalDatasource _authLocalDatasource;

  AuthRepositoryImpl(
      {required AuthService authService,
      required AuthLocalDatasource authLocalDatasource})
      : _authService = authService,
        _authLocalDatasource = authLocalDatasource;

  @override
  Future<DataState<AuthResponse>> login(LoginRequest request) async {
    try {
      final DataState<AuthResponse> result = await _authService.login(request);
      if (result.data != null) {
        await _authLocalDatasource.saveLoggedInToken(result.data?.token);
      }
      return result;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> logout() async {
    await _authLocalDatasource.saveLoggedInToken(null);
    await _authLocalDatasource.saveLoggedInUser(null);
    _authService.logout();
  }

  @override
  Future<DataState<AuthResponse>> register(RegisterRequest request) async {
    try {
      final DataState<AuthResponse> result =
          await _authService.register(request);
      if (result.data != null) {
        await _authLocalDatasource.saveLoggedInToken(result.data?.token);
      }
      return result;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<DataState<User>> editProfile(UpdateProfileRequest request) {
    return _authService.editProfile(request);
  }
  @override
  Future<DataState<Avatar?>> uploadFile(XFile file) {
    return _authService.uploadFile(file);
  }


  @override
  Future<DataState<User>> getMyProfile() async {
    try {
      final DataState<User> result = await _authService.getMyProfile();
      await _authLocalDatasource.saveLoggedInUser(result.data);
      return result;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<DataState> forgotPassword(String email) {
    return _authService.forgotPassword(email);
  }

  @override
  Future<DataState<String?>> changePassword(
      String currentPass, String newPass) {
    return _authService.changePassword(currentPass, newPass);
  }
}
