// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'signup_bloc.dart';

@immutable
abstract class SignupEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class RequestEmailSignUp extends SignupEvent {
  final String username;
  final String email;
  final String password;
  final String confirmPassword;

  RequestEmailSignUp({
    required this.username,
    required this.email,
    required this.password,
    required this.confirmPassword,
  });
  @override
  List<Object?> get props => [username, email, password, confirmPassword];
}
