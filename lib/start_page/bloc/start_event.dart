part of 'start_bloc.dart';

abstract class StartEvent extends Equatable {
  const StartEvent();

  @override
  List<Object> get props => [];
}

class IsRegEvent extends StartEvent {}
