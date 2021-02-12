import 'package:flutter/material.dart';
import '../widgets/spinner/spinner.dart';

class SplashScreen extends StatelessWidget {
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
              Padding(
                padding: EdgeInsets.symmetric(vertical: 50),
                child: Spinner(),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
