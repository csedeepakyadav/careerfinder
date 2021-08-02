import 'package:careerfinder/src/bloc/authBloc/auth_event.dart';
import 'package:careerfinder/src/bloc/authBloc/auth_states.dart';
import 'package:careerfinder/src/repositories/auth_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/foundation.dart';

class AuthBloc extends Bloc<AuthEvents, AuthState> {
  AuthRepository authRepository;
  AuthBloc({@required AuthState initialState, @required this.authRepository})
      : super(initialState);

  @override
  Stream<AuthState> mapEventToState(AuthEvents event) async* {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isLoggedIn = false;
    isLoggedIn = prefs.getBool('loggedIn');

    if (event is StartEvent) {
      yield AuthInitState();
    } else if (event is AuthCheckEvent) {
      yield AuthLoadingState();
      if (isLoggedIn == false || isLoggedIn == null) {
        yield UserNotLoggedInState();
      } else {
        yield UserLoggedInState();
      }
    } else if (event is LoginButtonPressed) {
      yield AuthLoadingState();
      var data = await authRepository.login(
          email: event.email,
          password: event.password,
          userType: event.userType);
      if (data.status == "false") {
        yield AuthErrorState(message: data.message);
      } else {
        await prefs.setString('name', data.name);
        await prefs.setString('email', data.email);
        await prefs.setBool('loggedIn', true);
        yield UserLoginSuccessState();
      }
    } else if (event is SignupButtonPressed) {
      yield AuthLoadingState();
      var data = await authRepository.signup(
          name: event.name,
          mobileNumber: event.mobileNumber,
          email: event.email,
          password: event.password,
          userType: event.userType);
      if (data.status == "false") {
        yield AuthErrorState(message: data.message);
      } else {
        /* await prefs.setString('name', data.name);
        await prefs.setString('email', data.email);
        await prefs.setBool('loggedIn', true); */
        yield UserSignedup();
      }
    }
  }
}
