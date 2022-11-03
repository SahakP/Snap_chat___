part of 'start_bloc.dart';

abstract class StartState extends Equatable {
  const StartState();

  @override
  List<Object> get props => [];
}

class StartInitial extends StartState {}

class IsRegState extends StartState {
  final bool isReg;
  User? user;
  IsRegState({required this.isReg, required this.user});
}
