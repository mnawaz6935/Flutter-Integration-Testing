import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_patrol_testing_framework/features/auth/data/models/login_response.dart';
import 'package:flutter_patrol_testing_framework/features/auth/data/repository/auth_repository.dart';
import 'package:meta/meta.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<LoginEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<LoginActionEvent>(onLoginAction);
  }

  FutureOr<void> onLoginAction(
      LoginActionEvent event, Emitter<LoginState> emit) async {
    try {
      emit(LoginLoading());
      var response = await AuthRepository.loginAction(
          username: event.username, password: event.password);
      emit(LoginSuccess(response: response!));
    } catch (e) {
      emit(LoginFailed(errorMessage: e.toString()));
    }
  }
}
