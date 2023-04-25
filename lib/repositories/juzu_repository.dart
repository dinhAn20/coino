import 'package:injectable/injectable.dart';
import 'package:trading_app/data/remote/juzu/juzu_service.dart';

import '../common/api_client/data_state.dart';
import '../models/juzu.dart';

abstract class JuzuRepository {
  Future<DataState<List<Juzu>>> getJuzu();
}

@LazySingleton(as: JuzuRepository)
class JuzuRepositoryImpl implements JuzuRepository {
  final JuzuService _juzuService;

  JuzuRepositoryImpl({required JuzuService juzuService})
      : _juzuService = juzuService;

  @override
  Future<DataState<List<Juzu>>> getJuzu() {
    return _juzuService.getJuzu();
  }
}
