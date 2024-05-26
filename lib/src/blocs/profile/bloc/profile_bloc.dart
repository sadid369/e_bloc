import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:e_bloc/src/data/model/user_model.dart';
import 'package:e_bloc/src/data/repository/profile_repository.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final ProfileRepository profileRepository;
  ProfileBloc({required this.profileRepository}) : super(ProfileInitial()) {
    on<FetchAppData>(_fetchAppData);
  }

  FutureOr<void> _fetchAppData(
      FetchAppData event, Emitter<ProfileState> emit) async {
    emit(ProfileInitial());
    try {
      final user = await profileRepository.fetchUserFromFirestore();
      debugPrint("_fetchAppData: ${user!.userName}");
      emit(ProfileFetchedSuccess(user: user));
    } catch (e) {
      debugPrint("Error signing in with Google: $e");
    }
  }
}
