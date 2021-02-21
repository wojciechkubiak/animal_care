import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../config/colors.dart';
import '../widgets/forms/input.dart';
import 'package:intl/intl.dart';
import '../blocs/login/login_bloc.dart';
import '../models/models.dart';
import 'package:uuid/uuid.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import '../widgets/spinner/spinner.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:convert/convert.dart';

class RegisterForm extends StatefulWidget {
  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  String _id = Uuid().v4();
  String _email;
  String _password;
  String _firstname;
  String _lastname;
  String _gender = "M";

  int _genderIndex = 0;

  DateTime selectedDate = DateTime.utc(1990, 1, 1);

  Future<void> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(1960),
        lastDate: DateTime(2022),
        builder: (BuildContext context, Widget child) {
          return Theme(
              data: ThemeData.light().copyWith(
                primaryColor: CustomColor.mainAccent, //Head background
                accentColor: CustomColor.mainAccent, //selection color
                //dialogBackgroundColor: Colors.white,//Background color
              ),
              child: child);
        });
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

  Future<void> _showDialog(BuildContext context) async {
    Alert(
      context: context,
      title: "Konto stworzone",
      content: Padding(
        padding: EdgeInsets.only(top: 32),
        child: Spinner(),
      ),
      buttons: [
        DialogButton(
          color: CustomColor.mainAccent,
          onPressed: () => Navigator.pop(context),
          child: Text(
            "Zaloguj",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        )
      ],
    ).show();
  }

  Future<Map<String, dynamic>> _registerData() async {
    Auth registerData = Auth(
      id: this._id,
      email: this._email,
      password: this._password,
    );
    return registerData.toJson();
  }

  Future<Map<String, dynamic>> _userData() async {
    RegisterData userData = RegisterData(
      id: this._id,
      firstname: this._firstname,
      lastname: this._lastname,
      gender: this._gender,
      birthdate: DateFormat('yyyy-MM-dd').format(this.selectedDate),
    );
    return userData.toJson();
  }

  Future<http.Response> _createUser(LoginBloc loginBloc) async {
    final response = await http.post(
      Uri.http('${env['IP']}:3000', 'register'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'id': this._id,
        'email': this._email,
        'password': this._password,
      }),
    );
    if (response.statusCode == 200) {
      // loginBloc.add(LoginInitialShow());
      // _showDialog(context);
      _loginUser(loginBloc);
    }
    // return response;
  }

  Future<http.Response> _loginUser(LoginBloc loginBloc) async {
    final response = await http.post(
      Uri.http('192.168.1.215:3000', 'login'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'email': this._email,
        'password': this._password,
      }),
    );
    if (response.statusCode == 200) {
      var responseBody = jsonDecode(response.body);
      print(responseBody["token"]);
    }
    return response;
  }

  @override
  Widget build(BuildContext context) {
    final loginBloc = BlocProvider.of<LoginBloc>(context);

    final node = FocusScope.of(context);

    return SingleChildScrollView(
      child: Container(
        color: Colors.white,
        child: Column(
          children: [
            AppBar(
              backgroundColor: Colors.white,
              elevation: 0,
              leading: IconButton(
                onPressed: () => loginBloc.add(LoginInitialShow()),
                icon: Icon(Icons.arrow_back),
                color: CustomColor.darkGreenAccent,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Stack(
                children: [
                  Container(
                    width: double.infinity,
                    margin: EdgeInsets.only(top: 54, bottom: 54),
                    padding: EdgeInsets.only(
                      top: 72,
                      bottom: 20,
                      left: 20,
                      right: 20,
                    ),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        // boxShadow: [
                        //   BoxShadow(
                        //     color: Colors.grey.withOpacity(0.3),
                        //     spreadRadius: 5,
                        //     blurRadius: 7,
                        //     offset: Offset(0, 3), // changes position of shadow
                        //   ),
                        // ],
                        borderRadius: BorderRadius.circular(40)),
                    child: Column(
                      children: [
                        Text("Zarejestruj",
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
                          changeHandler: (text) => {
                            setState(() {
                              _email = text;
                            })
                          },
                        ),
                        Input(
                          labelText: 'Hasło',
                          labelColor: Colors.black45,
                          textColor: Colors.black54,
                          fillColor: CustomColor.secondaryAccent,
                          borderColor: Colors.white,
                          obscure: true,
                          node: node,
                          changeHandler: (text) => {
                            setState(() {
                              _password = text;
                            })
                          },
                        ),
                        Input(
                          labelText: 'Imię',
                          labelColor: Colors.black45,
                          textColor: Colors.black54,
                          fillColor: CustomColor.secondaryAccent,
                          borderColor: Colors.white,
                          node: node,
                          changeHandler: (text) => {
                            setState(() {
                              _firstname = text;
                            })
                          },
                        ),
                        Input(
                          labelText: 'Nazwisko',
                          labelColor: Colors.black45,
                          textColor: Colors.black54,
                          fillColor: CustomColor.secondaryAccent,
                          borderColor: Colors.white,
                          node: node,
                          changeHandler: (text) => {
                            setState(() {
                              _lastname = text;
                            })
                          },
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20.0),
                          child: ToggleSwitch(
                            minWidth: 90.0,
                            minHeight: 70.0,
                            initialLabelIndex: _genderIndex,
                            cornerRadius: 20.0,
                            activeFgColor: Colors.white,
                            inactiveBgColor: CustomColor.secondaryAccent,
                            inactiveFgColor: Colors.white,
                            labels: ['', '', ''],
                            icons: [
                              FontAwesomeIcons.mars,
                              FontAwesomeIcons.venus,
                              FontAwesomeIcons.transgender
                            ],
                            iconSize: 30.0,
                            activeBgColors: [
                              CustomColor.mainAccent,
                              CustomColor.mainAccent,
                              CustomColor.mainAccent
                            ],
                            onToggle: (index) {
                              const genderList = ['Male', 'Female', 'Other'];

                              // setState(() {
                              _genderIndex = index;
                              _gender = genderList[index];
                              // });
                              // _setGender(index);r
                              print('switched to: $index');
                            },
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              padding: EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: CustomColor.mainAccent,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.2),
                                    spreadRadius: 1,
                                    blurRadius: 12,
                                    offset: Offset(
                                      0,
                                      3,
                                    ),
                                  ),
                                ],
                              ),
                              child: IconButton(
                                onPressed: () => _selectDate(context),
                                icon: Icon(Icons.cake_rounded),
                                iconSize: 32,
                                color: Colors.white,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              child: Text(
                                DateFormat('dd/MM/yyyy').format(selectedDate),
                                style: TextStyle(
                                    fontSize: 20, color: Colors.black45),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 36),
                          child: RaisedButton(
                            padding: EdgeInsets.symmetric(
                                horizontal: 70, vertical: 15),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0)),
                            color: CustomColor.mainAccent,
                            onPressed: () async {
                              var _registerDataJSON = await _registerData();
                              var _userDataJSON = await _userData();

                              // print(_temp)
                              print(_registerDataJSON);
                              print(_userDataJSON);
                              _createUser(loginBloc);
                            },
                            child: Text(
                              'ZAREJESTRUJ',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 18),
                            ),
                          ),
                        ),
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
                        Icons.person_add_rounded,
                        size: 54,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
