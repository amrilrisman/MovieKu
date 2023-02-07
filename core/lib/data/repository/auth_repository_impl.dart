import 'dart:io';

import 'package:core/data/data_source/data_remote_source_auth.dart';
import 'package:core/domain/entity/user_login_entity.dart';
import 'package:core/domain/repository/auth_repository.dart';
import 'package:core/utils/db_failure.dart';
import 'package:dartz/dartz.dart';
import 'package:core/utils/failure.dart';

class AuthRepositoryImplementation extends AuthRepository {
  final AuthRemoteSource authremote;

  AuthRepositoryImplementation(this.authremote);

  @override
  Future<Either<Failure, Map>> authLogin(UserLoginEntity userLogin) async {
    try {
      final result = await authremote.userLogin(userLogin);
      return Right(result);
    } on ServerException {
      return const Left(ServerFailure('Server error'));
    } on SocketException {
      return const Left(ConnectingFailure('lost connect'));
    }
  }

  @override
  Future<Either<Failure, Map>> guestLogin() async {
    try {
      final result = await authremote.guestLogin();
      return Right(result);
    } on ServerException {
      return const Left(ServerFailure('server error'));
    } on ServerSocket {
      return const Left(ConnectingFailure('Lost Connect'));
    }
  }
}
