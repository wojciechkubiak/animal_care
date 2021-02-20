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
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            color: Colors.white,
            child: Center(
              child: Stack(
                children: [
                  Container(
                    width: double.infinity,
                    margin: EdgeInsets.only(top: 54),
                    padding: EdgeInsets.only(
                      top: 72,
                      bottom: 20,
                      left: 32,
                      right: 32,
                    ),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        // boxShadow: [
                        //   BoxShadow(
                        //     // color: Colors.grey.withOpacity(0.3),
                        //     spreadRadius: 5,
                        //     blurRadius: 7,
                        //     offset: Offset(0, 3), // changes position of shadow
                        //   ),
                        // ],
                        borderRadius: BorderRadius.circular(40)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text("Zaloguj",
                            style: TextStyle(
                              fontSize: 36,
                              color: Colors.black54,
                            )),
                        SizedBox(height: 32),
                        Input(
                            labelText: 'Email',
                            labelColor: Colors.black45,
                            textColor: Colors.black54,
                            fillColor: CustomColor.secondaryAccent,
                            borderColor: Colors.white,
                            node: node,
                            changeHandler: () {}),
                        Input(
                            labelText: 'Hasło',
                            labelColor: Colors.black45,
                            textColor: Colors.black54,
                            fillColor: CustomColor.secondaryAccent,
                            borderColor: Colors.white,
                            obscure: true,
                            node: node,
                            changeHandler: () {}),
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 30),
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
                            style: TextStyle(color: CustomColor.mainAccent),
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
                      ],
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    margin: EdgeInsets.only(top: 15),
                    child: Container(
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: CustomColor.mainAccent,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            spreadRadius: 1,
                            blurRadius: 12,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Icon(
                        Icons.pets_rounded,
                        size: 54,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        return SplashScreen();
      },
    );
  }
}
