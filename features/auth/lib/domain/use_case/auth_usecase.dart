import 'package:core/domain/entity/user_login_entity.dart';
import 'package:core/domain/repository/auth_repository.dart';
import 'package:core/utils/failure.dart';
import 'package:dartz/dartz.dart';

class AuthUseCase {
  final AuthRepository authRepository;

  AuthUseCase(this.authRepository);

  Future<Either<Failure, Map>> executeUser(UserLoginEntity userEntity) async {
    return authRepository.authLogin(userEntity);
  }

  Future<Either<Failure, Map>> executeGuest() async {
    return authRepository.guestLogin();
  }
}
