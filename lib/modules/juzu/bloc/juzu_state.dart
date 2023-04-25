import 'package:equatable/equatable.dart';
import 'package:trading_app/models/juzu.dart';
import '../../../models/pagination.dart';

class JuzuState extends Equatable {
  const JuzuState(
      {this.status = DataSourceStatus.initial, this.juzus, this.message});

  final DataSourceStatus status;
  final String? message;
  final List<Juzu>? juzus;

  JuzuState copyWith(
      {List<Juzu>? juzus, DataSourceStatus? status, String? message}) {
    return JuzuState(
        status: status ?? this.status,
        message: message ?? this.message,
        juzus: juzus ?? this.juzus);
  }

  @override
  List<Object?> get props => <Object?>[status, juzus, message];
}
