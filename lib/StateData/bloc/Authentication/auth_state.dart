part of 'auth_cubit.dart';

class AuthState {
  ButtonState ButtionState;
  AuthState({required this.ButtionState});
}
/*
class AuthInitial extends AuthState {
  AuthInitial({required super.ButtionState});

  @override
  bool operator ==(Object other) => false;
}

class AuthSuccessState extends AuthState {
  @override
  bool operator ==(Object other) => false;
}

class AuthErrorState extends AuthState {
  String error;
  AuthErrorState(this.error);
  @override
  bool operator ==(Object other) => false;
}

class AuthLoading extends AuthState {
  @override
  bool operator ==(Object other) => false;
}

class AuthRefreshState extends AuthState {
  @override
  bool operator ==(Object other) => false;
}
*/
