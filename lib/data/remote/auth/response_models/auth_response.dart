
import '../../../../models/user.dart';

class AuthResponse {
  AuthResponse({
    this.userInfo,
    this.token,
  });

  final User? userInfo;
  final String? token;

  factory AuthResponse.fromJson(Map<String?, dynamic>? json) => AuthResponse(
        userInfo:
            json?["userInfo"] != null ? User.fromJson(json?["userInfo"]) : null,
        token: json?["token"],
      );
}
