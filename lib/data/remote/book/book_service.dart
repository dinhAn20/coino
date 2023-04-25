import 'package:injectable/injectable.dart';
import 'package:trading_app/models/book.dart';
import '../../../common/api_client/api_client.dart';
import '../../../common/api_client/data_state.dart';
import '../api_endpoint.dart';
import '../helper/index.dart';

abstract class BookService {
  Future<DataState<List<Book>>> getBooks();
}

@LazySingleton(as: BookService)
class BookServiceImpl implements BookService {
  BookServiceImpl(this._apiClient);

  final ApiClient _apiClient;

  @override
  Future<DataState<List<Book>>> getBooks() async {
    final ApiHelper<Book> helper = ApiHelper<Book>();
    return helper.getListWithoutMore(
        _apiClient.get(path: ApiEndpoint.books), Book.fromJson);
  }
}
