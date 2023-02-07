import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable implements Exception {
  final String message;

  const Failure(this.message);
  @override
  List<Object?> get props => [message];
}

class ServerFailure extends Failure {
  const ServerFailure(super.message);
}

class ConnectingFailure extends Failure {
  const ConnectingFailure(super.message);
}

class DatabaseErrorFailure extends Failure {
  const DatabaseErrorFailure(super.message);
}

class CacheFailure extends Failure {
  const CacheFailure(super.message);
}
