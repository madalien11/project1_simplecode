import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project1_simplecode/repo/repo_auth.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc({required this.repo}) : super(AuthInitial()) {
    on<LoginEvent>((event, emit) async {
      emit(LoginLoading());
      final result = await repo.login(
        login: event.login,
        password: event.password,
      );
      if (result.errorMessage != null) {
        emit(LoginError(error: result.errorMessage!));
        return;
      }
      emit(LoginSuccessful(token: result.token!));
    });
  }

  final RepoAuth repo;
}
