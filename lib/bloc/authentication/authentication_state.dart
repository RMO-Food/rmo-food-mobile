part of 'authentication_cubit.dart';

@immutable
sealed class AuthenticationState {}

final class AuthenticationInitial extends AuthenticationState {}

final class AuthenticationAuthenticated extends AuthenticationState {}

final class AuthenticationUnAuthenticated extends AuthenticationState {}
