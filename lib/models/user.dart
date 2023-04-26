import 'package:equatable/equatable.dart';
import 'package:trading_app/common/utils/utils.dart';

class User extends Equatable {
  const User({this.id, this.email, this.avatar, this.name,});

  final int? id;
  final String? email;
  final String? avatar;
  final String? name;

  factory User.fromJson(Map<String?, dynamic> json) => User(
        id: parseInt(json['_id']),
        email: json['email'],
        avatar: json['avatar'],
        name: json['name'],
       
      );

  factory User.fromLocal(Map<String?, dynamic> json) => User.fromJson(json);

  User copyWith({
    int? id,
    String? email,
    String? dob,
    String? avatar,
    String? name,
   
  }) {
    return User(
      id: id ?? this.id,
      email: email ?? this.email,
      avatar: avatar ?? this.avatar,
      name: name ?? this.name,
     
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "_id": id,
      "email": email,
      "avatar": avatar,
      "name": name,
    };
  }

  @override
  List<Object?> get props => [id, email, name, avatar];
}
