part of 'login_cubit.dart';

@immutable
sealed class LoginState {}

final class LoginInitial extends LoginState {}

final class LoginLoading extends LoginState {}

final class LoginSuccess extends LoginState {
  final String uId;
  LoginSuccess(this.uId);
}

final class LoginError extends LoginState {
  final String error;
  LoginError(this.error);
}

final class LoginGetUserLoading extends LoginState {}

final class LoginGetUserSuccess extends LoginState {}

final class LoginGetUserError extends LoginState {
  final String error;
  LoginGetUserError(this.error);
}
