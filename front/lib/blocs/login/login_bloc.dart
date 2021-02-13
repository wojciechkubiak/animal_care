import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import '../../services/services.dart';
import '../../models/models.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthService _AuthService;

  LoginBloc(AuthService AuthService)
      : assert(AuthService != null),
        _AuthService = AuthService,
        super(LoginInitial());

  @override
  LoginState get initialState => LoginInitial();

  @override
  Stream<LoginState> mapEventToState(
    LoginEvent event,
  ) async* {
    if (event is LoginInitialShow) {
      yield* _mapAppAuthInitialToState(event);
    }
    if (event is AuthForm) {
      yield* _mapAppAuthFormToState(event);
    }
    if (event is LoginWithForm) {
      yield* _mapAppAuthFormLoginToState(event);
    }
    if (event is RegisterWithForm) {
      yield* _mapAppAuthFormRegisterToState(event);
    }
    if (event is AuthRemember) {
      yield* _mapAppAuthRememberFormState(event);
    }
    if (event is AuthRememberWithForm) {
      yield* _mapAppAuthRememberWithFormState(event);
    }
  }

  Stream<LoginState> _mapAppAuthRememberFormState(AuthRemember event) async* {
    yield ForgotPassword();
  }

  Stream<LoginState> _mapAppAuthInitialToState(LoginInitialShow event) async* {
    yield LoginInitial();
  }

  Stream<LoginState> _mapAppAuthFormToState(AuthForm event) async* {
    yield AuthFormInitial();
  }

  Stream<LoginState> _mapAppAuthFormLoginToState(LoginWithForm event) async* {
    yield Logged();
  }

  Stream<LoginState> _mapAppAuthFormRegisterToState(
      RegisterWithForm event) async* {
    yield Register();
  }

  Stream<LoginState> _mapAppAuthRememberWithFormState(
      AuthRememberWithForm event) async* {
    yield LoginLoading();
    try {
      if (await _AuthService.rememberWithForm(event.email)) {
        yield Logged();
      } else {
        yield ForgotPassword();
      }
    } catch (e) {
      // yield AuthFailure(message: e.message ?? 'An unknown error occurred');
    }
  }

  // Stream<LoginState> _mapAppAuthToState(AuthWithProvider event) async* {
  //   yield LoginLoading();
  //   try {
  //     if (await _AuthService.authWithProvider(event.authProvider)) {
  //       yield Logged();
  //     } else {
  //       yield NotLoggedWithProvider(
  //         authProvider: event.authProvider,
  //       );
  //     }
  //   } catch (e) {
  //     // yield AuthFailure(message: e.message ?? 'An unknown error occurred');
  //   }
  // }

  // Stream<LoginState> _mapAppAuthLoginWithFormState(
  //     AuthLogedWithForm event) async* {
  //   yield LoginLoading();
  //   try {
  //     if (await _AuthService.authWithForm(event.email, event.password)) {
  //       yield Logged();
  //     } else {
  //       yield NotLoggedWithForm(
  //         email: event.email,
  //         password: event.password,
  //       );
  //     }
  //   } catch (e) {
  //     // yield AuthFailure(message: e.message ?? 'An unknown error occurred');
  //   }
  // }

  // Stream<LoginState> _mapAppAuthRegisterWithFormState(
  //     AuthRegisteredWithForm event) async* {
  //   yield LoginLoading();
  //   try {
  //     if (await _AuthService.registerWithForm(event.register)) {
  //       yield Registered();
  //     } else {
  //       yield NotRegisteredWithForm(register: event.register);
  //     }
  //   } catch (e) {
  //     // yield AuthFailure(message: e.message ?? 'An unknown error occurred');
  //   }
  // }
}
