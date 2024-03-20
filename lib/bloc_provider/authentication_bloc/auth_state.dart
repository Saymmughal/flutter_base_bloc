abstract class AuthState {}

class AuthInitialState extends AuthState {}

class AuthChangeState extends AuthState {}

class AuthLoadingState extends AuthState {}

class AuthErrorState extends AuthState {
  final String errorMessage;
  AuthErrorState(this.errorMessage);
}
