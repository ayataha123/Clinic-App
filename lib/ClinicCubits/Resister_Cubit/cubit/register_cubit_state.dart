part of 'register_cubit.dart';

@immutable
sealed class RegisterCubitState {}

final class RegisterCubitInitial extends RegisterCubitState {}

final class RegisterLoadingState extends RegisterCubitState {}
final class RegisterSucessState extends RegisterCubitState {}
final class RegisterFailureState extends RegisterCubitState {
  String message;

  RegisterFailureState({required this.message});
}