part of 'auth_user_bloc.dart';

abstract class AuthUserEvent extends Equatable {
  const AuthUserEvent();

  @override
  List<Object> get props => [];
}

class OnUserLogin extends AuthUserEvent {
  final BuildContext context;
  final UserLoginEntity userEntity;

  const OnUserLogin({required this.userEntity, required this.context});
  @override
  List<Object> get props => [userEntity];
}

class OnGuestLogin extends AuthUserEvent {
  final BuildContext context;

  const OnGuestLogin(this.context);
}
