part of 'register_cubit.dart';

@immutable
sealed class RegisterState {}

final class RegisterInitialState extends RegisterState {}

final class RegisterSuccessState extends RegisterState {
  final String uId;

  RegisterSuccessState(this.uId);
}

final class RegisterLoadingState extends RegisterState {}

final class RegisterErrorState extends RegisterState {
  final String error;

  RegisterErrorState(this.error);
}

final class RegisterSuccessCreateUserState extends RegisterState {}

final class RegisterErrorCreateUserState extends RegisterState {
  final String error;

  RegisterErrorCreateUserState(this.error);
}

final class RegisterGoogleSuccessState extends RegisterState {}

final class RegisterGoogleLoadingState extends RegisterState {}

final class RegisterGoogleErrorState extends RegisterState {
  final String error;

  RegisterGoogleErrorState(this.error);
}

final class RegisterFacebookSuccessState extends RegisterState {}

final class RegisterFacebookLoadingState extends RegisterState {}

final class RegisterFacebookErrorState extends RegisterState {
  final String error;

  RegisterFacebookErrorState(this.error);
}

class RegisterFacebookCancelledState extends RegisterState {}
