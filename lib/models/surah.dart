import 'package:equatable/equatable.dart';
import 'package:trading_app/common/utils/utils.dart';
import 'package:trading_app/models/multi_text.dart';

import 'ayah.dart';

class Surah extends Equatable {
  const Surah({this.id, this.number, this.title, this.ayahs});

  final String? id;
  final int? number;
  final MultiText? title;
  final List<Ayah>? ayahs;

  factory Surah.fromJson(Map<String?, dynamic> json) => Surah(
      id: json['_id'],
      number: parseInt(json['number']),
      title: json['title'] != null ? MultiText.fromJson(json['title']) : null,
      ayahs: json['ayahs'] != null
          ? List.from(json['ayahs']).map((e) => Ayah.fromJson(e)).toList()
          : null);

  factory Surah.fromLocal(Map<String?, dynamic> json) => Surah.fromJson(json);

  Surah copyWith(
      {String? id, int? number, MultiText? title, List<Ayah>? ayahs}) {
    return Surah(
      id: id ?? this.id,
      number: number ?? this.number,
      title: title ?? this.title,
      ayahs: ayahs ?? this.ayahs,
    );
  }

  Map<String, dynamic> toJson() {
    return {"_id": id, "number": number, "title": title, "ayahs": ayahs};
  }

  @override
  List<Object?> get props => [id, number, title, ayahs];
}
