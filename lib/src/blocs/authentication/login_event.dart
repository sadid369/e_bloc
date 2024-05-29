// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'login_bloc.dart';

@immutable
abstract class LoginEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class RequestGoogleLogin extends LoginEvent {}

class RequestFacebookLogin extends LoginEvent {}

class RequestTwitterLogin extends LoginEvent {}

class RequestEmailLogin extends LoginEvent {
  final String email;
  final String password;
  final bool isRemember;
  RequestEmailLogin({
    required this.email,
    required this.password,
    required this.isRemember,
  });
  @override
  List<Object?> get props => [email, password, isRemember];
}

class LogoutEvent extends LoginEvent {}

class LogoutFailedEvent extends LoginEvent {}
