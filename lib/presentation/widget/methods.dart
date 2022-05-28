import 'dart:math';

import 'package:flappy_bird/const/const.dart';
import 'package:flappy_bird/presentation/widget/mytext.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

int getRandomRange(int min, int max) => min + Random().nextInt(max - min);

Widget buildTapToPlay() {
  return !gamecontrollerCubit.gameStart
      ? Container(
          alignment: const Alignment(0, -0.5),
          child: MyText(
            'T A P   T O   P L A Y',
            fontSize: 20.sp,
          ),
        )
      : const SizedBox();
}
