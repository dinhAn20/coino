import 'package:injectable/injectable.dart';
import 'package:trading_app/data/remote/book/book_service.dart';
import 'package:trading_app/models/book.dart';

import '../common/api_client/data_state.dart';

abstract class BookRepository {
  Future<DataState<List<Book>>> getBooks();
}

@LazySingleton(as: BookRepository)
class BookRepositoryImpl implements BookRepository {
  final BookService _bookService;

  BookRepositoryImpl({required BookService bookService})
      : _bookService = bookService;

  @override
  Future<DataState<List<Book>>> getBooks() {
    return _bookService.getBooks();
  }
}
