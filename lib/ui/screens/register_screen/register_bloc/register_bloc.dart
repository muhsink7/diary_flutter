import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc() : super(RegisterInitialState());

  @override
  Stream<RegisterState> mapEventToState(RegisterEvent event) async* {
    if (event is RegisterButtonPressed) {
      yield RegisterLoadingState();

      // Simulate API call or registration logic
      await Future.delayed(Duration(seconds: 2));

      // Validate registration fields (Replace with your actual registration logic)
      if (event.password != event.confirmPassword) {
        yield RegisterErrorState(error: "Passwords do not match");
      } else {
        yield RegisterSuccessState();
      }
    }
  }
}
