
import 'package:flappy_bird/presentation/widget/mytext.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class DashBoardWidget extends StatelessWidget {
  const DashBoardWidget({
    Key? key,
    required this.score,
    required this.highScore,
  }) : super(key: key);
  final String score;
  final String highScore;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.brown.shade500,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: ListTile(
              title:
                  MyText('SCORE', textAlign: TextAlign.center, fontSize: 15.sp),
              subtitle: MyText(
                score,
                fontSize: 25,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Expanded(
            child: ListTile(
              title:
                  MyText('BEST', textAlign: TextAlign.center, fontSize: 15.sp),
              subtitle: MyText(
                highScore,
                fontSize: 25,
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
