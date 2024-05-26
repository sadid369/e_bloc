// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'profile_bloc.dart';

@immutable
abstract class ProfileState {}

class ProfileInitial extends ProfileState {}

class ProfileFetchedSuccess extends ProfileState {
  final UserModel? user;
  ProfileFetchedSuccess({
    required this.user,
  });
}
