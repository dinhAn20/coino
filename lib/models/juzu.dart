
import 'package:equatable/equatable.dart';
import 'package:trading_app/common/utils/utils.dart';
import 'package:trading_app/models/multi_text.dart';
import 'package:trading_app/models/surah.dart';

import 'ayah.dart';
class Juzu extends Equatable {
  const Juzu({this.id, this.number, this.title, this.items});

  final String? id;
  final int? number;
  final MultiText? title;
  final List<JuzuItem>? items;

  factory Juzu.fromJson(Map<String?, dynamic> json) => Juzu(
      id: json['_id'],
      number: parseInt(json['number']),
      title: json['title'] != null ? MultiText.fromJson(json['title']) : null,
      items: json['items'] != null ? List.from(json['items']).map((e) => JuzuItem.fromJson(e)).toList() : null
      );

  factory Juzu.fromLocal(Map<String?, dynamic> json) => Juzu.fromJson(json);

  Juzu copyWith({
     String? id,
     int? number,
     MultiText? title,
    List<JuzuItem>? items
  }) {
    return Juzu(
      id: id ?? this.id,
      number: number ?? this.number,
      title: title ?? this.title,
      items: items ?? this.items,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "_id": id,
      "number": number,
      "title": title,
      "items":items
    };
  }

  @override
  List<Object?> get props => [id, number, title,items];
}

class JuzuItem extends Equatable {
  const JuzuItem({ this.surah, this.ayahs});

  final Surah? surah;
  final List<Ayah>? ayahs;

  factory JuzuItem.fromJson(Map<String?, dynamic> json) => JuzuItem(
      surah: json['surah'] != null ? Surah.fromJson(json['surah']) : null,
      ayahs: json['ayahs'] != null ? List.from(json['ayahs']).map((e) => Ayah.fromJson(e)).toList() : null
  );

  factory JuzuItem.fromLocal(Map<String?, dynamic> json) => JuzuItem.fromJson(json);

  JuzuItem copyWith({
    Surah? surah,
    List<Ayah>? ayahs
  }) {
    return JuzuItem(
      surah: surah ?? this.surah,
      ayahs: ayahs ?? this.ayahs,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "surah": surah,
      "ayahs":ayahs
    };
  }

  @override
  List<Object?> get props => [surah,ayahs];
}
