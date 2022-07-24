part of 'auth_bloc.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}

class LoginLoading extends AuthState {}

class LoginError extends AuthState {
  LoginError({required this.error});
  final String error;
}

class LoginSuccessful extends AuthState {
  LoginSuccessful({required this.token});
  final String token;
}
