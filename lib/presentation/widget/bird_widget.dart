import 'package:flutter/material.dart';

class Bird extends StatelessWidget {
  const Bird(
      {Key? key,
      required this.yAxis,
      required this.width,
      required this.height})
      : super(key: key);

  final double yAxis;
  final double width;
  final double height;
  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment(0, yAxis),
        child: Image.asset(
          'assets/bird.png',
          width: MediaQuery.of(context).size.width * width / 2,
          fit: BoxFit.fill,
          height: MediaQuery.of(context).size.width * 3 / 4 * height / 2,
        ));
  }
}
