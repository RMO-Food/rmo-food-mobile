part of 'profile_bloc.dart';

@immutable
sealed class ProfileState {}

final class ProfileInitial extends ProfileState {}

final class ProfileFetching extends ProfileState {}

final class ProfileFetched extends ProfileState {
  final ProfileData profileData;
  ProfileFetched({required this.profileData});
}

final class ProfileFetchError extends ProfileState {
  final String errorMessage;
  ProfileFetchError(this.errorMessage);
}
