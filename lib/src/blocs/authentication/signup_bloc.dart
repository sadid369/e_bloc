import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:e_bloc/src/data/repository/auth_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'signup_event.dart';
part 'signup_state.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  final AuthRepository auth;
  SignupBloc({required this.auth}) : super(SignupInitial()) {
    on<RequestEmailSignUp>(_requestEmailSignUp);
  }

  FutureOr<void> _requestEmailSignUp(
      RequestEmailSignUp event, Emitter<SignupState> emit) async {
    emit(SignUpLoading());
    try {
      await auth.signUpWithEmail(
        email: event.email,
        password: event.password,
        username: event.username,
      );
      emit(SignUpSuccess());
    } catch (e) {
      emit(SignUpFailed(message: e.toString()));
    }
  }
}
