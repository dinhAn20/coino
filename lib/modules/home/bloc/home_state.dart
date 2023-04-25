import 'package:equatable/equatable.dart';
import '../../../models/pagination.dart';
import '../../../models/surah.dart';

class HomeState extends Equatable {
  const HomeState(
      {this.status = DataSourceStatus.initial,
      this.surahs,
      this.searchedSurahs,
      this.message});

  final DataSourceStatus status;
  final String? message;
  final List<Surah>? surahs;
  final List<Surah>? searchedSurahs;

  HomeState copyWith(
      {List<Surah>? surahs,
      List<Surah>? searchedSurahs,
      DataSourceStatus? status,
      String? message}) {
    return HomeState(
        status: status ?? this.status,
        message: message ?? this.message,
        surahs: surahs ?? this.surahs,
        searchedSurahs: searchedSurahs ?? this.searchedSurahs);
  }

  @override
  List<Object?> get props => <Object?>[status, surahs, searchedSurahs, message];
}
