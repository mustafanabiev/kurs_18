part of 'auth_cubit.dart';

class AuthState {
  AuthState({
    this.token,
    this.password,
  });

  final String? token;
  final String? password;

  AuthState copyWith({
    String? token,
    String? password,
  }) {
    return AuthState(
      token: token ?? this.token,
      password: password ?? this.password,
    );
  }
}
