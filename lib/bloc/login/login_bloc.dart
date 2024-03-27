import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:rmo_food/infrastructure/model/user.dart';
import 'package:rmo_food/infrastructure/response/error.dart';
import 'package:rmo_food/service/http_executer.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  // final _httpApiRepoImpl = getIt.get<HttpApiRepoImpl>();
  LoginBloc() : super(LoginInitial()) {
    on<LoginButtonPressed>(_initLogin);
  }

  void _initLogin(LoginButtonPressed event, emit) async {
    HttpExecuter httpExecuter = HttpExecuter();
    emit(LoggingIn());
    try {
      final response = await httpExecuter
          .loginExecution(User(email: event.email, password: event.password));

      if (response is ErrorRes) {
        emit(LogginError(response.errorMessage));
        return;
      }
      emit(LoggedIn());
    } on String catch (e) {
      emit(LogginError(e.toString()));
    } catch (e) {
      emit(LogginError(e.toString()));
    }
  }
}
