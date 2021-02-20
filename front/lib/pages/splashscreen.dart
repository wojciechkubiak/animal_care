import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/spinner/spinner.dart';
import '../config/colors.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    _getThingsOnStartup(0).then((value) {
      // setState(() => height = height * 20);
      print('costam');
    });
    super.initState();
  }

  Future _getThingsOnStartup(int ms) async {
    await Future.delayed(Duration(milliseconds: ms));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        AnimatedContainer(
          duration: Duration(seconds: 1),
          child: Lottie.asset('assets/lotties/bird.json'),
        ),
        Column(
          children: [
            Text(
              'Animacare',
              style: TextStyle(
                  fontSize: 46,
                  color: CustomColor.darkGreenAccent,
                  fontFamily: 'Merienda'),
            ),
            Text(
              'Your loved ones diary',
              style: TextStyle(fontSize: 10, color: CustomColor.mainAccent),
            ),
          ],
        ),
        AnimatedContainer(
          duration: Duration(seconds: 1),
          child: Spinner(),
        ),
      ],
    );
  }
}
