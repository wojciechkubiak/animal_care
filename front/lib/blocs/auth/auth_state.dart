part of 'auth_bloc.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthSplashScreen extends AuthState {}

class AuthAuthentication extends AuthState {}

class AuthNotAuthentication extends AuthState {}
