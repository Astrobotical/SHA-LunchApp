part of 'passwordreset_cubit.dart';

sealed class PasswordresetState extends Equatable {
  ButtonState currentstate;
  PasswordresetState({required this.currentstate});

  @override
  List<Object> get props => [];
}

final class PasswordresetInitial extends PasswordresetState {
  PasswordresetInitial({required super.currentstate});
}

final class PasswordresetLoading extends PasswordresetState {
  PasswordresetLoading({required super.currentstate});
}

final class PasswordresetSuccess extends PasswordresetState {
  PasswordresetSuccess({required super.currentstate});
}

final class PasswordresetError extends PasswordresetState {
  PasswordresetError({required super.currentstate});
}

final class TokenFail extends PasswordresetState {
  TokenFail({required super.currentstate});
}

final class TokenSuccess extends PasswordresetState {
  TokenSuccess({required super.currentstate});
}

final class PasswordResetSuccess extends PasswordresetState {
  PasswordResetSuccess({required super.currentstate});
}

final class PasswordConfirmationFailed extends PasswordresetState {
  int box;
  String errormessage;
  PasswordConfirmationFailed(
      {required super.currentstate,
      required this.errormessage,
      required this.box});
}
