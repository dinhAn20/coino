import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:trading_app/models/juzu.dart';
import 'package:trading_app/repositories/juzu_repository.dart';
import '../../../common/api_client/data_state.dart';
import '../../../common/event/event_bus_mixin.dart';
import '../../../models/pagination.dart';
import 'juzu_state.dart';

@Injectable()
class JuzuCubit extends Cubit<JuzuState> with EventBusMixin {
  late final JuzuRepository _juzuRepository;

  JuzuCubit({
    required JuzuRepository juzuRepository,
  }) : super(const JuzuState(juzus: [])) {
    _juzuRepository = juzuRepository;
  }


  Future<void> fetchItems() async {
    try {
      final DataState<List<Juzu>> results =
          await _juzuRepository.getJuzu();
      if (results is DataSuccess) {
        emit(state.copyWith(
          juzus: results.data,
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
