import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:bloc/bloc.dart';
import '../../pages/pages.dart';
import 'package:meta/meta.dart';
import '../../services/services.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthService _AuthService;

  AuthBloc(AuthService AuthService)
      : assert(AuthService != null),
        _AuthService = AuthService,
        super(AuthInitial());

  @override
  AuthState get initialState => AuthInitial();

  @override
  Stream<AuthState> mapEventToState(AuthEvent event) async* {
    if (event is AuthLoaded) {
      yield* _mapAppLoadedToState(event);
    }
    if (event is AuthLoggedOut) {
      yield* _mapAppLogOutToState(event);
    }
    if (event is AuthLoadedOK) {
      yield* _mapAppLogedOKState(event);
    }
    if (event is AuthSplashScreenOK) {
      yield* _mapAppSplashScreenState(event);
    }
  }

  Stream<AuthState> _mapAppLogedOKState(AuthLoadedOK event) async* {
    yield AuthLoading();
    try {
      final currentUser = await _AuthService.getCurrent();
      if (currentUser) {
        yield AuthAuthentication();
      } else {
        yield AuthNotAuthentication();
      }
    } catch (e) {
      // yield AuthFailure(message: e.message ?? 'An unknown error occurred');
    }
  }

  Stream<AuthState> _mapAppLoadedToState(AuthLoaded event) async* {
    yield AuthLoading();
    try {
      final currentUser = await _AuthService.getCurrent();
      if (currentUser) {
        yield AuthAuthentication();
      } else {
        yield AuthNotAuthentication();
      }
    } catch (e) {
      // yield AuthFailure(message: e.message ?? 'An unknown error occurred');
    }
  }

  Stream<AuthState> _mapAppLogOutToState(AuthLoggedOut event) async* {
    yield AuthLoading();
    try {
      final logout = await _AuthService.logOut();
      if (logout) {
        yield AuthNotAuthentication();
      } else {
        yield AuthAuthentication();
      }
    } catch (e) {
      // yield AuthFailure(message: e.message ?? 'An unknown error occurred');
    }
  }

  Stream<AuthState> _mapAppSplashScreenState(AuthSplashScreenOK event) async* {
    yield AuthSplashScreen();
    try {
      await Future.delayed(Duration(seconds: 2));
      if (await _AuthService.getCurrent()) {
        yield AuthAuthentication();
      } else {
        yield AuthNotAuthentication();
      }
    } catch (e) {
      // yield AuthFailure(message: e.message ?? 'An unknown error occurred');
    }
  }
}
