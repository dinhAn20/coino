import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';
import 'package:trading_app/data/remote/auth/request_models/login_request.dart';
import 'package:trading_app/data/remote/auth/request_models/register_request.dart';
import 'package:trading_app/data/remote/auth/request_models/update_profile_request.dart';
import 'package:trading_app/models/avatar.dart';

import '../../../common/api_client/api_client.dart';
import '../../../common/api_client/api_response.dart';
import '../../../common/api_client/data_state.dart';
import '../../../models/user.dart';
import '../api_endpoint.dart';
import '../helper/index.dart';
import 'response_models/auth_response.dart';

abstract class AuthService {
  Future<DataState<AuthResponse>> login(LoginRequest request);

  Future<DataState<AuthResponse>> register(RegisterRequest request);

  Future<DataState> forgotPassword(String email);

  Future<DataState<User>> editProfile(UpdateProfileRequest request);

  Future<DataState<User>> getMyProfile();

  Future<DataState<String?>> changePassword(String currentPass, String newPass);

  Future<DataState<String?>> logout();

  Future<DataState<Avatar?>> uploadFile(XFile file);
}

@LazySingleton(as: AuthService)
class AuthServiceImpl implements AuthService {
  AuthServiceImpl(this._apiClient);

  final ApiClient _apiClient;

  @override
  Future<DataState<AuthResponse>> login(LoginRequest request) async {
    final ApiHelper<AuthResponse> helper = ApiHelper<AuthResponse>();
    return helper.requestApi(
        _apiClient.post(path: ApiEndpoint.login, data: request.toJson()),
        parseItem: AuthResponse.fromJson);
  }

  @override
  Future<DataState<AuthResponse>> register(RegisterRequest request) {
    final ApiHelper<AuthResponse> helper = ApiHelper<AuthResponse>();
    return helper.requestApi(
        _apiClient.post(path: ApiEndpoint.register, data: request.toJson()),
        parseItem: AuthResponse.fromJson);
  }

  @override
  Future<DataState<User>> editProfile(UpdateProfileRequest request) {
    final ApiHelper<User> helper = ApiHelper<User>();
    return helper.requestApi(
        _apiClient.put(path: ApiEndpoint.editProfile, data: request.toJson()),
        parseItem: User.fromJson);
  }

  @override
  Future<DataState<User>> getMyProfile() async {
    try {
      final ApiResponse result =
          await _apiClient.get(path: ApiEndpoint.profile);
      if (result.isSuccess()) {
        if (result.data is Map<String, dynamic>) {
          return DataSuccess<User>(
              User.fromJson(result.data as Map<String, dynamic>));
        } else {
          return DataSuccess<User>(result.data);
        }
      } else {
        return DataFailed<User>(result.message ?? '');
      }
    } on DioError catch (e) {
      return DataFailed<User>(e.message);
    } on Exception catch (e) {
      return DataFailed<User>(e.toString());
    }
  }

  @override
  Future<DataState> forgotPassword(String email) {
    final ApiHelper helper = ApiHelper();
    return helper.requestApi(
        _apiClient.post(path: ApiEndpoint.forgotPassword, data: {'email':email}));
  }

  @override
  Future<DataState<String?>> changePassword(
      String currentPass, String newPass) {
    final ApiHelper<String?> helper = ApiHelper<String?>();

    return helper.requestApi(_apiClient.post(
        path: ApiEndpoint.changePassword,
        data: {'oldPassword': currentPass, 'newPassword': newPass}));
  }

  @override
  Future<DataState<String?>> logout() {
    final ApiHelper<String?> helper = ApiHelper<String?>();
    return helper.requestApi(_apiClient.post(path: ApiEndpoint.logout));
  }

  @override
  Future<DataState<Avatar?>> uploadFile(XFile file) async {
    FormData formData;
    formData = FormData.fromMap({
      "image": await MultipartFile.fromFile(file.path, filename: file.name)
    });
    final ApiResponse result =
        await _apiClient.post(path: ApiEndpoint.files, data: formData);
    if (result.isSuccess() && result.data != null) {
      return DataSuccess<Avatar>(Avatar.fromJson(result.data));
    } else {
      return DataFailed<Avatar>(result.message ?? '');
    }
  }
}
