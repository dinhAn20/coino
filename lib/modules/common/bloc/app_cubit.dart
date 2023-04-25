import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:trading_app/common/event/event_bus_mixin.dart';
import 'app_state.dart';

@Singleton()
class AppCubit extends Cubit<AppState> with EventBusMixin {
  AppCubit() : super(const AppState(langCode: 'en'));

  void changeLanguage(String langCode) {
    emit(state.copyWith(langCode: langCode));
  }
}
