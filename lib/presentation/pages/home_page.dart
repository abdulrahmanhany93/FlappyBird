import 'package:flappy_bird/const/const.dart';
import 'package:flappy_bird/helper/cache_manager.dart';
import 'package:flappy_bird/logic/controller/gamecontroller_cubit.dart';
import 'package:flappy_bird/logic/pipes/pipescontroller_cubit.dart';
import 'package:flappy_bird/presentation/widget/bird_widget.dart';
import 'package:flappy_bird/presentation/widget/dashboard.dart';
import 'package:flappy_bird/presentation/widget/methods.dart';
import 'package:flappy_bird/presentation/widget/pipe_widget.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

/// y = gt^2 *vt;

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PipescontrollerCubit, PipescontrollerState>(
      builder: (context, state) {
        return Scaffold(
          body: GestureDetector(
            onTap: () {
              if (gamecontrollerCubit.gameStart) {
                gamecontrollerCubit.jump();
              } else {
                gamecontrollerCubit.startGame();
                pipescontrollerCubit.movePip();
              }
            },
            child: Column(children: [
              Expanded(
                  flex: 4,
                  child: Container(
                    color: Colors.blue,
                    child: Stack(
                      children: [
                        BlocBuilder<GamecontrollerCubit, GamecontrollerState>(
                          builder: (context, state) {
                            return Bird(
                                yAxis: gamecontrollerCubit.birdyAxis,
                                height: birdHeight,
                                width: birdWidth);
                          },
                        ),
                        Pipe(
                          //! upper pipe
                          pipewidth: fixedPipeWidth,
                          xAxis: pipesXaxis[0],
                          pipeheight: pipesHeight[0][0],
                          isThisBottomPipe: false,
                        ),
                        Pipe(
                          //! bottom pipe
                          pipewidth: fixedPipeWidth,
                          xAxis: pipesXaxis[1],
                          pipeheight: pipesHeight[0][1],
                          isThisBottomPipe: true,
                        ),
                        Pipe(
                          //! upper pipe
                          pipewidth: fixedPipeWidth,
                          xAxis: pipesXaxis[0],
                          pipeheight: pipesHeight[1][0],
                          isThisBottomPipe: false,
                        ),
                        Pipe(
                          //! bottom pipe
                          pipewidth: fixedPipeWidth,
                          xAxis: pipesXaxis[1],
                          pipeheight: pipesHeight[1][1],
                          isThisBottomPipe: true,
                        ),
                        BlocBuilder<GamecontrollerCubit, GamecontrollerState>(
                          builder: (context, state) {
                            if (gamecontrollerCubit.gameStart) {
                              return const SizedBox();
                            } else {
                              return buildTapToPlay();
                            }
                          },
                        ),
                      ],
                    ),
                  )),
              Container(
                height: 15,
                color: Colors.green,
              ),
              Expanded(
                  child: DashBoardWidget(
                score: pipescontrollerCubit.score.toString(),
                highScore: CachManager.getHighScore() == null
                    ? '0'
                    : CachManager.getHighScore().toString(),
              )),
            ]),
          ),
        );
      },
    );
  }
}
