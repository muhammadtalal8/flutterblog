import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_blog/domain/usecases/user_sign_up.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final UserSignup _userSignUp;
  AuthBloc({required UserSignup userSignUp})
      : _userSignUp = userSignUp,
        super(AuthInitial()) {
    on<AuthSignUp>((event, emit) async {
      emit(AuthLoading());
      final res = await _userSignUp(UserSignupParams(
        email: event.email,
        password: event.password,
        name: event.name,
      ));
      res.fold((failure) => emit(AuthFailure(failure.message)), (user) {
        emit(AuthSuccess(user));
      });
    });
  }
}
