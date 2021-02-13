part of 'login_bloc.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class AuthFormInitial extends LoginState {}

class Logged extends LoginState {}

class ForgotPassword extends LoginState {}

class Register extends LoginState {}

class Registered extends LoginState {}

class NotLogged extends LoginState {}

// class NotLoggedWithProvider extends LoginState {
//   final AuthProvider authProvider;

//   NotLoggedWithProvider({
//     @required this.authProvider,
//   });

//   @override
//   List<Object> get props => [authProvider];
// }

// class NotLoggedWithForm extends LoginState {
//   final String email;
//   final String password;

//   NotLoggedWithForm({
//     @required this.email,
//     @required this.password,
//   });

//   @override
//   List<Object> get props => [email, password];
// }

// class NotRegisteredWithForm extends LoginState {
//   final Register register;

//   NotRegisteredWithForm({@required this.register});

//   @override
//   List<Object> get props => [register];
// }
