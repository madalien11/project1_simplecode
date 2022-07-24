part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent {}

class LoginEvent extends AuthEvent {
  LoginEvent({
    required this.login,
    required this.password,
  });
  final String login;
  final String password;
}
