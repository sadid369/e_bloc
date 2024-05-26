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
    on<RequestFacebookLogin>(_facebookLogin);
    on<RequestTwitterLogin>(_twitterLogin);
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

  FutureOr<void> _facebookLogin(
      RequestFacebookLogin event, Emitter<LoginState> emit) {}

  FutureOr<void> _twitterLogin(
      RequestTwitterLogin event, Emitter<LoginState> emit) async {
    emit(LoginLoading());
    try {
      final user = await auth.signInWithTwitter();
      if (user != null) {
        debugPrint('User: ${user?.displayName}');
      }
    } catch (e) {
      debugPrint('${e.toString()}');
    }
  }
}
