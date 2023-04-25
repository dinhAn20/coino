
import 'package:injectable/injectable.dart';
import 'package:trading_app/models/surah.dart';

import '../../../common/api_client/api_client.dart';
import '../../../common/api_client/data_state.dart';
import '../api_endpoint.dart';
import '../helper/index.dart';

abstract class SurahService {
  Future<DataState<List<Surah>>> getSurah();
}

@LazySingleton(as: SurahService)
class SurahServiceImpl implements SurahService {
  SurahServiceImpl(this._apiClient);

  final ApiClient _apiClient;

  @override
  Future<DataState<List<Surah>>> getSurah() async {
    final ApiHelper<Surah> helper = ApiHelper<Surah>();
    return helper.getListWithoutMore(_apiClient.get(path: ApiEndpoint.surah),Surah.fromJson);
  }
}
