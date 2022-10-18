part of 'password_bloc.dart';

abstract class PasswordState {}

class PasswordInitial extends PasswordState {}

class PassState extends PasswordState {
  final bool IsPasswordValid;
  PassState({required this.IsPasswordValid});
}
