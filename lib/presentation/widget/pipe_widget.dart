import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Pipe extends StatelessWidget {
  Pipe(
      {Key? key,
      required this.xAxis,
      required this.pipeheight,
      required this.isThisBottomPipe,
      required this.pipewidth})
      : super(key: key);
  double xAxis;
  final double pipeheight;
  final double pipewidth;
  final bool isThisBottomPipe;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
        duration: const Duration(milliseconds: 0),
        alignment: Alignment(xAxis, isThisBottomPipe ? 1 : -1),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.green, border: Border.all(color: Colors.black)),
          width: MediaQuery.of(context).size.width * pipewidth / 2,
          height: MediaQuery.of(context).size.width * 3 / 4 * pipeheight / 2,
        ));
  }
}
