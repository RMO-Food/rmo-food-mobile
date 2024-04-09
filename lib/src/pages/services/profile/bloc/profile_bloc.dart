import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:rmo_food/src/pages/services/profile/data/model/profile.dart';
import 'package:rmo_food/src/pages/services/profile/data/repo/profile_repo.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final ProfileRepImpl _profileRepImpl = ProfileRepImpl();
  ProfileBloc() : super(ProfileInitial()) {
    on<FetchProfile>(_fetchProfile);
    on<UpdateProfile>(_updateProfile);
  }

  _fetchProfile(event, emit) async {
    emit(ProfileFetching());
    try {
      ProfileData profileData = await _profileRepImpl.fetchProfile();
      emit(ProfileFetched(profileData: profileData));
    } catch (e) {
      ProfileFetchError(e.toString());
    }
  }

  _updateProfile(event, emit) {}
}
