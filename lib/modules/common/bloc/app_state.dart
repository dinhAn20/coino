import 'package:equatable/equatable.dart';

class AppState extends Equatable {
  const AppState({this.langCode});

  final String? langCode;

  AppState copyWith({
    String? langCode,
  }) {
    return AppState(
      langCode: langCode ?? this.langCode,
    );
  }

  @override
  List<Object?> get props => <Object?>[langCode];
}
