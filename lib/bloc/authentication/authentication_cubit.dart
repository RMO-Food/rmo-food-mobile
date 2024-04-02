import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:rmo_food/core/dependencies/shared_pref.dart';
import 'package:rmo_food/service/http_executer.dart';

part 'authentication_state.dart';

class AuthenticationCubit extends Cubit<AuthenticationState> {
  final HttpExecuter _httpExecuter = HttpExecuter();
  AuthenticationCubit() : super(AuthenticationInitial());

  void checkIsAuthenticated() {
    try {
      if (SharedPref.getToken != null) {
        verifyToken();
        return;
      }
      emit(AuthenticationUnAuthenticated());
    } catch (e) {
      log(e.toString());
      emit(AuthenticationUnAuthenticated());
    }
  }

  void loggedIn() => emit(AuthenticationAuthenticated());

  void loggedOut() => emit(AuthenticationUnAuthenticated());

  void verifyToken() async {
    final verified = await _httpExecuter.verifyToken();
    try {
      if (verified) {
        emit(AuthenticationAuthenticated());
        return;
      }
      emit(AuthenticationUnAuthenticated());
    } catch (e) {
      emit(AuthenticationUnAuthenticated());
    }
  }
}
