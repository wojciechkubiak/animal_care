part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class AuthLoaded extends AuthEvent {}

class AuthLoadedOK extends AuthEvent {}

class AuthLoggedIn extends AuthEvent {}

class AuthUpdated extends AuthEvent {}

class AuthLoggedOut extends AuthEvent {}

class AuthRememberOK extends AuthEvent {}

class AuthSplashScreenOK extends AuthEvent {}
