import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:trading_app/models/surah.dart';
import 'package:trading_app/repositories/surah_repository.dart';
import '../../../common/api_client/data_state.dart';
import '../../../common/event/event_bus_mixin.dart';
import '../../../models/pagination.dart';
import 'home_state.dart';

@Injectable()
class HomeCubit extends Cubit<HomeState> with EventBusMixin {
  late final SurahRepository _surahRepository;

  HomeCubit({
    required SurahRepository surahRepository,
  }) : super(const HomeState(surahs: [])) {
    _surahRepository = surahRepository;
  }

  void searchSurahs(String? keyword) {
    if (keyword?.isNotEmpty ?? false) {
      emit(state.copyWith(
        searchedSurahs: state.surahs
            ?.where((e) =>
                (e.title?.enText
                        ?.toLowerCase()
                        .contains(keyword!.toLowerCase()) ??
                    false) ||
                (e.title?.enText
                        ?.toLowerCase()
                        .contains(keyword!.toLowerCase()) ??
                    false) ||
                (e.title?.enText
                        ?.toLowerCase()
                        .contains(keyword!.toLowerCase()) ??
                    false))
            .toList(),
      ));
    } else {
      emit(state.copyWith(
        searchedSurahs: [],
      ));
    }
  }

  Future<void> fetchItems() async {
    try {
      final DataState<List<Surah>> results = await _surahRepository.getSurah();
      if (results is DataSuccess) {
        emit(state.copyWith(
          surahs: results.data,
          status: (results.data ?? []).isEmpty
              ? DataSourceStatus.empty
              : DataSourceStatus.success,
        ));
      }
    } on Exception catch (e) {
      emit(state.copyWith(
          status: DataSourceStatus.failed, message: e.toString()));
    }
  }
}
