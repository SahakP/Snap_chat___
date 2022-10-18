part of 'username_bloc.dart';

abstract class UsernameEvent {}

class UsernaemEvent extends UsernameEvent {
  final String username;
  UsernaemEvent({required this.username});
}
