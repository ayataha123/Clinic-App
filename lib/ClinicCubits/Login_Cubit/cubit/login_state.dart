part of 'login_cubit.dart';

@immutable
sealed class LoginState {}

final class LoginInitial extends LoginState {}
final class LoginLoadingState extends LoginState{}
final class LoginSucessState extends LoginState {}
final class LoginFailureState extends LoginState {
  String message;

 LoginFailureState({required this.message});
}