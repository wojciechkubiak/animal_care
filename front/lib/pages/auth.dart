import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';

class Auth extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
                margin: EdgeInsets.only(top: 75, bottom: 128),
                height: 154,
                width: 154,
                child: Image.asset(
                  'assets/images/logo.png',
                ),
              ),
              Container(
                child: Column(children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                    child: TextFormField(
                      style: TextStyle(color: Colors.white, fontSize: 18),
                      textAlign: TextAlign.center,
                      cursorColor: Color(0xFFc3eae2),
                      decoration: InputDecoration(
                        filled: true,
                        focusColor: Colors.red,
                        labelText: "Email",
                        labelStyle: TextStyle(color: Colors.white),
                        alignLabelWithHint: true,
                        fillColor: Colors.white10,
                        hintText: "eg. john@mail.com",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.white70),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.white70),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.white70),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                    child: TextFormField(
                      style: TextStyle(color: Colors.white, fontSize: 18),
                      textAlign: TextAlign.center,
                      obscureText: true,
                      cursorColor: Color(0xFFc3eae2),
                      decoration: InputDecoration(
                        filled: true,
                        focusColor: Colors.red,
                        labelText: "Hasło",
                        labelStyle: TextStyle(color: Colors.white),
                        alignLabelWithHint: true,
                        fillColor: Colors.white10,
                        // hintText: "eg. john@mail.com",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.white70),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.white70),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.white70),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 30),
                    child: RaisedButton(
                      padding:
                          EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                      color: Color(0xFF38b89e),
                      onPressed: () => print('Zaloguj'),
                      child: Text(
                        'ZALOGUJ',
                        style: TextStyle(color: Colors.white, fontSize: 18),
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
                            ..onTap = () => print('Zarejestruj'),
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
  }
}
