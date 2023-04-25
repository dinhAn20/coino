import 'package:equatable/equatable.dart';
import 'package:trading_app/common/utils/utils.dart';
import 'package:trading_app/models/multi_text.dart';

class Ayah extends Equatable {
  const Ayah({this.id, this.number, this.title, this.content, this.audio});

  final String? id;
  final int? number;
  final MultiText? title;
  final MultiText? content;
  final String? audio;

  factory Ayah.fromJson(Map<String?, dynamic> json) => Ayah(
        id: json['_id'],
        number: parseInt(json['number']),
        title: json['title'] != null ? MultiText.fromJson(json['title']) : null,
        content: json['content'] != null
            ? MultiText.fromJson(json['content'])
            : null,
        audio: json['audio'],
      );

  factory Ayah.fromLocal(Map<String?, dynamic> json) => Ayah.fromJson(json);

  Ayah copyWith(
      {String? id,
      int? number,
      MultiText? title,
      MultiText? content,
      String? audio}) {
    return Ayah(
      id: id ?? this.id,
      number: number ?? this.number,
      title: title ?? this.title,
      content: content ?? this.content,
      audio: audio ?? this.audio,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "_id": id,
      "number": number,
      "title": title,
      "content": content,
      "audio": audio
    };
  }

  @override
  List<Object?> get props => [id, number, title, content, audio];
}
