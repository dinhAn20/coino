import 'package:equatable/equatable.dart';

import '../../../common/enums/status.dart';
import '../../../models/user.dart';

class AuthState extends Equatable {
  const AuthState(
      {this.user,
      this.token,
      this.loginStatus,
      this.loginMessage,
      this.signUpStatus,
      this.signUpMessage,
      this.forgotPassStatus,
      this.forgotPassMessage});

  final User? user;
  final String? token;
  final RequestStatus? loginStatus;
  final String? loginMessage;

  final RequestStatus? signUpStatus;
  final String? signUpMessage;
  final RequestStatus? forgotPassStatus;
  final String? forgotPassMessage;
  factory AuthState.initState() => const AuthState();

  AuthState copyWith({
    User? user,
    String? token,
    RequestStatus? loginStatus,
    String? loginMessage,
    RequestStatus? signUpStatus,
    String? signUpMessage,
    RequestStatus? forgotPassStatus,
    String? forgotPassMessage,

  }) {
    return AuthState(
      user: user ?? this.user,
      token: token ?? this.token,
      loginStatus: loginStatus ?? this.loginStatus,
      loginMessage: loginMessage ?? this.loginMessage,
      signUpStatus: signUpStatus ?? this.signUpStatus,
      signUpMessage: signUpMessage ?? this.signUpMessage,
      forgotPassStatus: forgotPassStatus ?? this.forgotPassStatus,
      forgotPassMessage: forgotPassMessage ?? this.forgotPassMessage,
    );
  }

  @override
  List<Object?> get props => <Object?>[
        user,
        token,
        loginStatus,
        loginMessage,
        signUpStatus,
        signUpMessage,
        forgotPassStatus,
        forgotPassMessage,

      ];
}
