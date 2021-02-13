import 'package:flutter/material.dart';
import 'package:validators/sanitizers.dart';
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
  String _birthdate;

  int _genderIndex = 0;

  DateTime selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(1960),
      lastDate: DateTime(2022),
    );
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

  Future<void> _showDialog(BuildContext context) async {
    Alert(
      context: context,
      title: "Tworzenie konta",
      content: Padding(
        padding: EdgeInsets.only(top: 32),
        child: Spinner(),
      ),
      buttons: [
        DialogButton(
          color: CustomColor.mainAccent,
          onPressed: () => Navigator.pop(context),
          child: Text(
            "Anuluj",
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
      birthdate: this._birthdate,
    );
    return userData.toJson();
  }

  @override
  Widget build(BuildContext context) {
    final loginBloc = BlocProvider.of<LoginBloc>(context);

    final node = FocusScope.of(context);

    return SingleChildScrollView(
      child: Container(
        color: CustomColor.mainAccent,
        child: Column(
          children: [
            AppBar(
              backgroundColor: CustomColor.mainAccent,
              elevation: 0,
              leading: IconButton(
                onPressed: () => loginBloc.add(LoginInitialShow()),
                icon: Icon(Icons.arrow_back),
              ),
            ),
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.only(top: 54, bottom: 54),
                  padding: EdgeInsets.only(
                    top: 72,
                    bottom: 20,
                    left: 32,
                    right: 32,
                  ),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
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
                      SizedBox(
                        height: 12,
                      ),
                      ToggleSwitch(
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
                      SizedBox(
                        height: 12,
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
                                      0, 3), // changes position of shadow
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
                                  fontSize: 20, color: Colors.black54),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 24),
                        child: RaisedButton(
                          padding: EdgeInsets.symmetric(
                              horizontal: 50, vertical: 15),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0)),
                          color: CustomColor.mainAccent,
                          onPressed: () async {
                            var _registerDataJSON = await _registerData();
                            var _userDataJSON = await _userData();

                            // print(_temp)
                            print(_registerDataJSON);
                            print(_userDataJSON);
                            _showDialog(context);
                          },
                          child: Text(
                            'ZAREJESTRUJ',
                            style: TextStyle(color: Colors.white, fontSize: 18),
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
                      Icons.pets_rounded,
                      size: 54,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
