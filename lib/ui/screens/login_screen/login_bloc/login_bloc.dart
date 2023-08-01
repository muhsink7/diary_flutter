import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitialState());

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is LoginButtonPressed) {
      yield LoginLoadingState();

      // Simulate API call or authentication logic
      await Future.delayed(Duration(seconds: 2));

      // Check login credentials (Replace with your actual authentication logic)
      if (event.email == "example@example.com" && event.password == "password") {
        yield LoginSuccessState();
      } else {
        yield LoginErrorState(error: "Invalid credentials");
      }
    }
  }
}
