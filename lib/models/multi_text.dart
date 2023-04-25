import 'package:equatable/equatable.dart';
import 'package:trading_app/di/injection.dart';

import '../modules/common/bloc/app_cubit.dart';

class MultiText extends Equatable {
  const MultiText({this.enText, this.arText, this.swText});

  final String? enText;
  final String? arText;
  final String? swText;

  factory MultiText.fromJson(Map<String?, dynamic> json) =>
      MultiText(enText: json['en'], arText: json['ar'], swText: json['sw']);

  factory MultiText.fromLocal(Map<String?, dynamic> json) =>
      MultiText.fromJson(json);

  MultiText copyWith({
    String? enText,
    String? arText,
    String? swText,
  }) {
    return MultiText(
      enText: enText ?? this.enText,
      arText: arText ?? this.arText,
      swText: swText ?? this.swText,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "en": enText,
      "ar": arText,
      "sw": swText,
    };
  }

  String get _langCode => getIt<AppCubit>().state.langCode ?? 'en';

  String? get toDisplay => _langCode == 'en'
      ? enText
      : _langCode == 'ar'
          ? arText
          : swText;

  @override
  List<Object?> get props => [enText, arText, swText];
}
