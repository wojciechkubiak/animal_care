import 'package:flutter/material.dart';
import 'package:validators/sanitizers.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../config/colors.dart';
import '../widgets/forms/input.dart';
import 'package:intl/intl.dart';
import '../blocs/login/login_bloc.dart';

class RegisterForm extends StatefulWidget {
  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  DateTime selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: selectedDate, // Refer step 1
      firstDate: DateTime(1960),
      lastDate: DateTime(2022),
    );
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
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
                  margin: EdgeInsets.only(top: 54),
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
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40),
                          topRight: Radius.circular(40))),
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
                        fillColor: Colors.black12,
                        borderColor: Colors.white,
                        node: node,
                      ),
                      Input(
                        labelText: 'Hasło',
                        labelColor: Colors.black45,
                        textColor: Colors.black54,
                        fillColor: Colors.black12,
                        borderColor: Colors.white,
                        obscure: true,
                        node: node,
                      ),
                      Input(
                        labelText: 'Imię',
                        labelColor: Colors.black45,
                        textColor: Colors.black54,
                        fillColor: Colors.black12,
                        borderColor: Colors.white,
                        node: node,
                      ),
                      Input(
                        labelText: 'Nazwisko',
                        labelColor: Colors.black45,
                        textColor: Colors.black54,
                        fillColor: Colors.black12,
                        borderColor: Colors.white,
                        node: node,
                      ),
                      Input(
                        labelText: 'Ulubione zwierzę',
                        textColor: Colors.black54,
                        labelColor: Colors.black45,
                        fillColor: Colors.black12,
                        borderColor: Colors.white,
                        node: node,
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Text('Data urodzenia:',
                          style:
                              TextStyle(fontSize: 18, color: Colors.black45)),
                      SizedBox(
                        height: 12,
                      ),
                      // showDatePicker()
                      InkWell(
                        child: Text(
                          DateFormat('dd/MM/yyyy').format(selectedDate),
                          style: TextStyle(fontSize: 24, color: Colors.black54),
                        ),
                        onTap: () => _selectDate(context),
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 30, top: 24),
                        child: RaisedButton(
                          padding: EdgeInsets.symmetric(
                              horizontal: 50, vertical: 15),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0)),
                          color: CustomColor.mainAccent,
                          onPressed: () => print('Zarejestruj'),
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
