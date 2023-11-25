part of 'auth_cubit.dart';

class AuthState {
  ButtonState ButtionState;
  String? AuthType = "Api";
  AuthState({required this.ButtionState,required this.AuthType});
}

class AuthInitial extends AuthState {
  AuthInitial({required super.ButtionState,required super.AuthType});
  @override
  bool operator ==(Object other) => false;
}

class AuthErrorState extends AuthState {
  String error;
  AuthErrorState(this.error) : super(ButtionState: ButtonState.fail,AuthType: "null");
  @override
  bool operator ==(Object other) => false;
}

class AuthSuccessState extends AuthState {
  AuthSuccessState({required super.ButtionState,required super.AuthType});
  @override
  bool operator ==(Object other) => false;
}

class AuthLoading extends AuthState {
  AuthLoading({required super.ButtionState,required super.AuthType});

  @override
  bool operator ==(Object other) => false;
}

class AuthRefreshState extends AuthState {
  AuthRefreshState({required super.ButtionState,required super.AuthType});

  @override
  bool operator ==(Object other) => false;
}
class AuthRegisterContinue extends AuthState{
  AuthRegisterContinue({required super.ButtionState,required super.AuthType});

@override
bool operator ==(Object other) => false;
}
