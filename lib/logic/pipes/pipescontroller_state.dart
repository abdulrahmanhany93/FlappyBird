part of 'pipescontroller_cubit.dart';

@immutable
abstract class PipescontrollerState {}

class PipescontrollerInitial extends PipescontrollerState {}

class PipeCreated extends PipescontrollerState {}

class PipeMoving extends PipescontrollerState {

}

class PipeRemoved extends PipescontrollerState {}
