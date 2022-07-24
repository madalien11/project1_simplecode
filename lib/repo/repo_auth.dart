import '../generated/l10n.dart';
import 'api.dart';

class RepoAuth {
  RepoAuth({required this.api});
  final Api api;

  Future<ResultRepoAuth> login({
    required String login,
    required String password,
  }) async {
    try {
      final result = await api.dio.post(
        'https://fakestoreapi.com/auth/login',
        data: {
          "username": login == "qwerty" ? "mor_2314" : "",
          "password": password == "123456ab" ? "83r5^_" : "",
        },
      );
      return ResultRepoAuth(token: result.data['token']);
    } catch (e) {
      return ResultRepoAuth(errorMessage: S.current.somethingWentWrong);
    }
  }
}

class ResultRepoAuth {
  ResultRepoAuth({
    this.token,
    this.errorMessage,
  });

  final String? errorMessage;
  final String? token;
}
