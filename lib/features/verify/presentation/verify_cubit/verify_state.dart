part of 'verify_cubit.dart';

@immutable
sealed class VerifyState {}

final class VerifyInitial extends VerifyState {}

final class SendEmailVerifyLoading extends VerifyState {}

final class SendEmailVerifySuccess extends VerifyState {}

final class SendEmailVerifyError extends VerifyState {
  final String error;
  SendEmailVerifyError(this.error);
}

final class CheckEmailVerifyLoading extends VerifyState {}

final class CheckEmailVerifySuccess extends VerifyState {}

final class CheckEmailVerifyError extends VerifyState {
  final String error;
  CheckEmailVerifyError(this.error);
}

final class UpdateUserVerifiedLoading extends VerifyState {}

final class UpdateUserVerifiedSuccess extends VerifyState {}

final class UpdateUserVerifiedError extends VerifyState {
  final String error;
  UpdateUserVerifiedError(this.error);
}
