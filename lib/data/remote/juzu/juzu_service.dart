
import 'package:injectable/injectable.dart';
import 'package:trading_app/models/juzu.dart';

import '../../../common/api_client/api_client.dart';
import '../../../common/api_client/data_state.dart';
import '../api_endpoint.dart';
import '../helper/index.dart';

abstract class JuzuService {
  Future<DataState<List<Juzu>>> getJuzu();
}

@LazySingleton(as: JuzuService)
class JuzuServiceImpl implements JuzuService {
  JuzuServiceImpl(this._apiClient);

  final ApiClient _apiClient;

  @override
  Future<DataState<List<Juzu>>> getJuzu() async {
    final ApiHelper<Juzu> helper = ApiHelper<Juzu>();
    return helper.getListWithoutMore(_apiClient.get(path: ApiEndpoint.juzu),Juzu.fromJson);
  }
}
