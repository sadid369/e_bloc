import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(ProfileInitial()) {
    on<FetchAppData>(_fetchAppData);
  }

  FutureOr<void> _fetchAppData(
      FetchAppData event, Emitter<ProfileState> emit) {
        e
      }
}
