part of 'login_bloc.dart';

@immutable
sealed class LoginState {}

final class LoginInitial extends LoginState {}

final class LoggingIn extends LoginState {}

final class LoggedIn extends LoginState {}

final class LogginError extends LoginState {
  final String errorMessage;
  LogginError(this.errorMessage);
}
