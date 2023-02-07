import 'package:core/domain/entity/user_login_entity.dart';
import 'package:core/utils/failure.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRepository {
  Future<Either<Failure, Map>> authLogin(
    UserLoginEntity userLogin,
  );
  Future<Either<Failure, Map>> guestLogin();
}
