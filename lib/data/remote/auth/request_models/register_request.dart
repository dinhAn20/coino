import 'package:trading_app/common/utils/extensions/interable_extension.dart';

class RegisterRequest {
  RegisterRequest({this.email, this.password,this.name});
  final String? name;
  final String? email;
  final String? password;

  Map<String, dynamic> toJson() {
    return {
      "name":name,
      "email": email,
      "password": password,
    }..removeNullAndEmpty();
  }
}
