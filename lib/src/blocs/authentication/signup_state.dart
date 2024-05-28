// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'signup_bloc.dart';

@immutable
abstract class SignupState extends Equatable {
  @override
  List<Object?> get props => [];
}

class SignupInitial extends SignupState {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmController = TextEditingController();

  @override
  List<Object?> get props => [
        usernameController,
        emailController,
        passwordController,
        confirmController
      ];
}

class SignUpSuccess extends SignupState {}

class SignUpLoading extends SignupState {}

class SignUpFailed extends SignupState {
  final String message;
  SignUpFailed({
    required this.message,
  });
  @override
  List<Object?> get props => [message];
}
