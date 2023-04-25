import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:trading_app/models/surah.dart';
import 'package:trading_app/modules/ayah/bloc/search_ayahs_state.dart';
import 'package:trading_app/repositories/surah_repository.dart';
import '../../../common/api_client/data_state.dart';
import '../../../common/event/event_bus_mixin.dart';
import '../../../common/utils/debounce.dart';
import '../../../models/ayah.dart';
import '../../../models/pagination.dart';
import '../../../repositories/ayah_repository.dart';

@Injectable()
class SearchAyahsCubit extends Cubit<SearchAyahsState> {
  late final AyahRepository _ayahRepository;

  SearchAyahsCubit({
    required AyahRepository ayahRepository,
  }) : super(const SearchAyahsState(ayahs: [])) {
    _ayahRepository = ayahRepository;
  }

  final _debounce = Debounce(milliseconds: 500);

  Future<void> searchItems(String keyword) async {
    _debounce.run(() {
      fetchItems(keyword: keyword);
    });
  }

  Future<void> fetchItems({String? keyword}) async {
    try {
      final DataState<List<Ayah>> results =
          await _ayahRepository.getAyahs(keyword: keyword);
      if (results is DataSuccess) {
        emit(state.copyWith(
          ayahs: results.data,
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
