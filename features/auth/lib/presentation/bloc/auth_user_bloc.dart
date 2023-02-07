import 'package:bloc/bloc.dart';
import 'package:core/core.dart';
import 'package:core/domain/entity/user_login_entity.dart';
import 'package:core/domain/repository/auth_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

part 'auth_user_event.dart';
part 'auth_user_state.dart';

class AuthUserBloc extends Bloc<AuthUserEvent, AuthUserState> {
  final AuthRepository authRepo;
  AuthUserBloc(this.authRepo) : super(AuthUserInitial()) {
    on<OnUserLogin>(_userLogin);

    on<OnGuestLogin>(_guestLogin);
  }

  _userLogin(OnUserLogin event, Emitter<AuthUserState> emit) async {
    emit(AuthUserLoading());
    final result = await authRepo.authLogin(event.userEntity);

    result.fold(
      (failure) {
        print('error ' + failure.message);
        ScaffoldMessenger.of(event.context).showSnackBar(
          SnackBar(
            content: Text("gaga"),
            backgroundColor: Colors.red,
          ),
        );
      },
      (data) {
        print('error ' + data.toString());
        Navigator.pushReplacementNamed(event.context, RouteName.homePage);
      },
    );
  }

  _guestLogin(OnGuestLogin event, Emitter<AuthUserState> emit) async {
    emit(AuthUserLoading());
    final result = await authRepo.guestLogin();
    result.fold(
      (failure) {
        emit(const AuthUserError({}));
        ScaffoldMessenger.of(event.context).showSnackBar(
          const SnackBar(
            content: Text("gaga"),
            backgroundColor: Colors.red,
          ),
        );
      },
      (data) {
        emit(AuthUserSuccess(data));
        Navigator.pushReplacementNamed(event.context, RouteName.homePage);
      },
    );
  }
}
