import 'package:injectable/injectable.dart';
import 'package:trading_app/models/surah.dart';

import '../../../common/api_client/api_client.dart';
import '../../../common/api_client/data_state.dart';
import '../../../models/ayah.dart';
import '../api_endpoint.dart';
import '../helper/index.dart';

abstract class AyahService {
  Future<DataState<List<Ayah>>> getAyahs({String? keyword});
}

@LazySingleton(as: AyahService)
class AyahServiceImpl implements AyahService {
  AyahServiceImpl(this._apiClient);

  final ApiClient _apiClient;

  @override
  Future<DataState<List<Ayah>>> getAyahs({String? keyword}) async {
    final ApiHelper<Ayah> helper = ApiHelper<Ayah>();
    return helper.getListWithoutMore(
        _apiClient.get(path: "${ApiEndpoint.ayah}?search=${keyword ?? ''}"),
        Ayah.fromJson);
  }
}
