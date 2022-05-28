import 'package:flappy_bird/logic/controller/gamecontroller_cubit.dart';
import 'package:flappy_bird/logic/pipes/pipescontroller_cubit.dart';

const double birdWidth = 0.2;
const double birdHeight = 0.2;
const double gravity = -4.9;

PipescontrollerCubit pipescontrollerCubit = PipescontrollerCubit();
GamecontrollerCubit gamecontrollerCubit = GamecontrollerCubit();
List<double> pipesXaxis = [2, 2 + 1.5]; // x axis of pipes

double fixedPipeWidth = 0.5; // width of pipes  (out of 2 where all screen is 2)

List<List<double>> pipesHeight = [
  [1, 1.5],
  [1, 1.5],
];
