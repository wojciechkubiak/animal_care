import 'package:animal_care/pages/splashscreen.dart';
import 'package:animal_care/widgets/forms/input.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/login/login_bloc.dart';
import '../models/models.dart';
import './pages.dart';
import '../config/colors.dart';

class Auth extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final loginBloc = BlocProvider.of<LoginBloc>(context);
    final node = FocusScope.of(context);

    return BlocConsumer<LoginBloc, LoginState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        // if (state is AuthFormInitial) return AuthInit();
        if (state is Register) return RegisterForm();
        // if (state is Registered) return RegisterConfirmation();
        // if (state is ForgotPassword) return PasswordForgotten();
        if (state is LoginInitial)
          return Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/bg.jpg"),
                      fit: BoxFit.cover,
                      alignment: Alignment.topCenter),
                ),
              ),
              SingleChildScrollView(
                padding: EdgeInsets.symmetric(vertical: 25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 35, bottom: 78),
                      height: 154,
                      width: 154,
                      child: Image.asset(
                        'assets/images/logo.png',
                      ),
                    ),
                    Container(
                      child: Column(children: [
                        Input(
                          labelText: 'Email',
                          labelColor: Colors.white,
                          fillColor: Colors.white10,
                          borderColor: Colors.white70,
                          node: node,
                          horizontalPadding: 30,
                        ),
                        Input(
                          labelText: 'Hasło',
                          labelColor: Colors.white,
                          fillColor: Colors.white10,
                          borderColor: Colors.white70,
                          obscure: true,
                          node: node,
                          horizontalPadding: 30,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          margin: EdgeInsets.only(bottom: 30),
                          child: RaisedButton(
                            padding: EdgeInsets.symmetric(
                                horizontal: 50, vertical: 15),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0)),
                            color: CustomColor.mainAccent,
                            onPressed: () => print('Zaloguj'),
                            child: Text(
                              'ZALOGUJ',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 18),
                            ),
                          ),
                        ),
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(text: 'Nie masz konta? '),
                              TextSpan(
                                text: 'Załóż konto',
                                style: TextStyle(fontWeight: FontWeight.bold),
                                recognizer: TapGestureRecognizer()
                                  ..onTap =
                                      () => loginBloc.add(RegisterWithForm()),
                              ),
                            ],
                          ),
                        )
                      ]),
                    )
                  ],
                ),
              ),
            ],
          );
        return SplashScreen();
      },
    );
  }
}
