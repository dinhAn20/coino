import 'package:trading_app/common/utils/extensions/interable_extension.dart';

class UpdateProfileRequest {
  UpdateProfileRequest({this.avatar, this.name, this.lastReadAyah});

  //
  final String? avatar;
  final String? name;
  final String? lastReadAyah;

  factory UpdateProfileRequest.empty() => UpdateProfileRequest();

  UpdateProfileRequest copyWith({
    String? avatar,
    String? name,
    String? lastReadAyah,
  }) {
    return UpdateProfileRequest(
        avatar: avatar ?? this.avatar,
        name: name ?? this.name,
        lastReadAyah: lastReadAyah ?? this.lastReadAyah);
  }

  Map<String, dynamic> toJson() {
    return ({
      "name": name ?? "",
      "avatar": avatar ?? "",
      "lastReadAyah": lastReadAyah ?? ""
    })
      ..removeNullAndEmpty();
  }
}
