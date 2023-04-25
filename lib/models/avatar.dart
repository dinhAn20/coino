import 'package:equatable/equatable.dart';

class Avatar extends Equatable {
  const Avatar({this.name, this.url});

  final String? name;
  final String? url;

  factory Avatar.fromJson(Map<String?, dynamic> json) => Avatar(
        name: json['name'],
        url: json['url'],
      );

  Avatar copyWith({
    String? url,
    String? name,
  }) {
    return Avatar(
      url: url ?? this.url,
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "url": url,
      "name": name,
    };
  }

  @override
  List<Object?> get props => [name, url];
}
