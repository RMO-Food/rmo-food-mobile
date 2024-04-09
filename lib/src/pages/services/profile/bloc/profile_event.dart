part of 'profile_bloc.dart';

@immutable
sealed class ProfileEvent {}

final class FetchProfile extends ProfileEvent {}

final class UpdateProfile extends ProfileEvent {}
