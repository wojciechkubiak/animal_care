import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final loaded = true;
  final spinkit = SpinKitFoldingCube(
    color: Colors.white,
    size: 50.0,
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        body: Container(
            padding: EdgeInsets.only(top: 50, bottom: 50),
            decoration: BoxDecoration(
                image: DecorationImage(
              image: AssetImage("assets/images/bg.jpg"),
              fit: BoxFit.cover,
            )),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset('assets/images/logo.png'),
                loaded
                    ? SingleChildScrollView(
                        child: Container(
                          child: Column(children: [
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 30, vertical: 10),
                              child: TextFormField(
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18),
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
                                    borderSide:
                                        BorderSide(color: Colors.white70),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide:
                                        BorderSide(color: Colors.white70),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide:
                                        BorderSide(color: Colors.white70),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 30, vertical: 10),
                              child: TextFormField(
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18),
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
                                    borderSide:
                                        BorderSide(color: Colors.white70),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide:
                                        BorderSide(color: Colors.white70),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide:
                                        BorderSide(color: Colors.white70),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            SizedBox(
                              // height: 44,
                              // width: 240,
                              child: RaisedButton(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 50, vertical: 15),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0)),
                                color: Color(0xFF38b89e),
                                onPressed: () => print('Zaloguj'),
                                child: Text(
                                  'ZALOGUJ',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 18),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 40,
                            ),
                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(text: 'Nie masz konta? '),
                                  TextSpan(
                                    text: 'Załóż konto',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () => print('Zarejestruj'),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                          ]),
                        ),
                      )
                    : SpinKitFoldingCube(
                        size: 50,
                        itemBuilder: (BuildContext context, int index) {
                          return DecoratedBox(
                            decoration: BoxDecoration(
                              color: index.isEven
                                  ? Color(0xFF38b89e)
                                  : Color(0xFFc3eae2),
                            ),
                          );
                        },
                      ),
              ],
            )),
      ),
    );
  }
}
