// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'login_bloc.dart';

@immutable
abstract class LoginState extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoginInitial extends LoginState {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  List<Object?> get props => [emailController, passwordController];
}

class LoginLoading extends LoginState {}

class LogoutState extends LoginState {}

class LogoutFailedState extends LoginState {
  final String message;
  LogoutFailedState({
    required this.message,
  });
  @override
  List<Object?> get props => [message];
}

class LoginSuccess extends LoginState {}

class LoginFailed extends LoginState {
  final String message;
  LoginFailed({
    required this.message,
  });
  @override
  List<Object?> get props => [message];
}
