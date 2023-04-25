import 'package:equatable/equatable.dart';
import 'package:trading_app/models/book.dart';
import '../../../models/pagination.dart';

class BookState extends Equatable {
  const BookState(
      {this.status = DataSourceStatus.initial, this.books, this.message});

  final DataSourceStatus status;
  final String? message;
  final List<Book>? books;

  BookState copyWith(
      {List<Book>? books, DataSourceStatus? status, String? message}) {
    return BookState(
        status: status ?? this.status,
        message: message ?? this.message,
        books: books ?? this.books);
  }

  @override
  List<Object?> get props => <Object?>[status, books, message];
}
