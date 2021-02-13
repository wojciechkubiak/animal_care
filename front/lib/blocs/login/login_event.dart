part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class LoginLoaded extends LoginEvent {}

class LoginWithForm extends LoginEvent {}

class RegisterWithForm extends LoginEvent {}

class LoginInitialShow extends LoginEvent {}

class AuthForm extends LoginEvent {}

class AuthRemember extends LoginEvent {}

// class AuthWithProvider extends LoginEvent {
//   final AuthProvider authProvider;

//   AuthWithProvider({@required this.authProvider});

//   @override
//   List<Object> get props => [authProvider];
// }

class AuthRememberWithForm extends LoginEvent {
  final String email;

  AuthRememberWithForm({@required this.email});

  @override
  List<Object> get props => [email];
}

class AuthLogedWithForm extends LoginEvent {
  final String email;
  final String password;

  AuthLogedWithForm({
    @required this.email,
    @required this.password,
  });

  @override
  List<Object> get props => [email, password];
}

class AuthRegisteredWithForm extends LoginEvent {
  final Register register;

  AuthRegisteredWithForm({@required this.register});

  @override
  List<Object> get props => [register];
}
