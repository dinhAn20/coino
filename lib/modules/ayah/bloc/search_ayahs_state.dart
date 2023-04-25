import 'package:equatable/equatable.dart';
import '../../../models/ayah.dart';
import '../../../models/pagination.dart';

class SearchAyahsState extends Equatable {
  const SearchAyahsState(
      {this.status = DataSourceStatus.initial, this.ayahs, this.message});

  final DataSourceStatus status;
  final String? message;
  final List<Ayah>? ayahs;

  SearchAyahsState copyWith(
      {List<Ayah>? ayahs, DataSourceStatus? status, String? message}) {
    return SearchAyahsState(
        status: status ?? this.status,
        message: message ?? this.message,
        ayahs: ayahs ?? this.ayahs);
  }

  @override
  List<Object?> get props => <Object?>[status, ayahs, message];
}
