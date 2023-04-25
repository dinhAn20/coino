import 'package:equatable/equatable.dart';
import 'package:trading_app/common/enums/status.dart';
import 'package:trading_app/models/avatar.dart';

import '../../../models/user.dart';

class EditProfileState extends Equatable {
  const EditProfileState(
      {this.status = RequestStatus.initial,
      this.user,
      this.message,
      this.file});

  final RequestStatus status;
  final String? message;
  final User? user;
  final Avatar? file;

  EditProfileState copyWith(
      {RequestStatus? status, User? user, String? message, Avatar? file}) {
    return EditProfileState(
        status: status ?? this.status,
        user: user ?? this.user,
        message: message ?? this.message,
        file: file ?? this.file);
  }

  @override
  List<Object?> get props => <Object?>[status, user, message, file];
}
