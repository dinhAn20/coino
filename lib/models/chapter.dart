import 'package:equatable/equatable.dart';
class Chapter extends Equatable {
  const Chapter({this.id, this.title, this.content});

  final String? id;
  final String? title;
  final String? content;

  factory Chapter.fromJson(Map<String?, dynamic> json) =>
      Chapter(id: json['id'], title: json['title'], content: json['content']);

  factory Chapter.fromLocal(Map<String?, dynamic> json) =>
      Chapter.fromJson(json);

  Chapter copyWith({String? id, String? title, String? content}) {
    return Chapter(
        id: id ?? this.id,
        title: title ?? this.title,
        content: content ?? this.content);
  }

  Map<String, dynamic> toJson() {
    return {"id": id, "title": title, "content": content};
  }

  @override
  List<Object?> get props => [id, title, content];
}
