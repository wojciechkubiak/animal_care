import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Spinner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final spinkit = SpinKitFoldingCube(
      color: Colors.white,
      size: 50.0,
    );
    return SpinKitFoldingCube(
      size: 50,
      itemBuilder: (BuildContext context, int index) {
        return DecoratedBox(
          decoration: BoxDecoration(
            color: index.isEven ? Color(0xFF38b89e) : Color(0xFFc3eae2),
          ),
        );
      },
    );
  }
}
