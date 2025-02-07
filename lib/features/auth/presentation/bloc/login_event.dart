part of 'login_bloc.dart';

@immutable
abstract class LoginEvent {}

class LoginActionEvent extends LoginEvent {
  final String username;
  final String password;

  LoginActionEvent({required this.username, required this.password});
}