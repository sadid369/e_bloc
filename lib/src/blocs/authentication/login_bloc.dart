import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import 'package:meta/meta.dart';

import '../../data/repository/repository.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthRepository auth;

  LoginBloc({required this.auth}) : super(LoginInitial()) {
    on<RequestGoogleLogin>(_googleLogin);
  }

  FutureOr<void> _googleLogin(
      RequestGoogleLogin event, Emitter<LoginState> emit) async {
    emit(LoginLoading());
    try {
      final user = await auth.signInWithGoogle();
      debugPrint('User: ${user!.displayName}');
      emit(LoginSuccess());
    } catch (e) {
      debugPrint(e.toString());
      emit(LoginFailed(message: e.toString()));
    }
  }
}
