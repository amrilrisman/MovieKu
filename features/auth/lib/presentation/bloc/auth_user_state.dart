part of 'auth_user_bloc.dart';

abstract class AuthUserState extends Equatable {
  const AuthUserState();

  @override
  List<Object> get props => [];
}

class AuthUserInitial extends AuthUserState {}

class AuthUserLoading extends AuthUserState {}

class AuthUserSuccess extends AuthUserState {
  final Map data;

  const AuthUserSuccess(this.data);
}

class AuthUserError extends AuthUserState {
  final Map data;

  const AuthUserError(this.data);
}
