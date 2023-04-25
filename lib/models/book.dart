import 'package:equatable/equatable.dart';
import 'chapter.dart';
class Book extends Equatable {
  const Book({this.id, this.name, this.image, this.chapters});

  final String? id;
  final String? name;
  final String? image;
  final List<Chapter>? chapters;

  factory Book.fromJson(Map<String?, dynamic> json) => Book(
      id: json['_id'],
      name: json['name'],
      image: json['image'],
      chapters: json['chapters']!=null  ?List.from(json["chapters"]).map((e) => Chapter.fromJson(e)).toList():null
  );

  factory Book.fromLocal(Map<String?, dynamic> json) => Book.fromJson(json);

  Book copyWith(
      {String? id, String? name, String? image,  List<Chapter>? chapters}) {
    return Book(
        id: id ?? this.id,
        name: name ?? this.name,
        image: image ?? this.image,
        chapters: chapters ?? this.chapters);
  }

  Map<String, dynamic> toJson() {
    return {"_id": id, "name": name, "image": image, "chapters": chapters};
  }

  @override
  List<Object?> get props => [id, name, image, chapters];
}
