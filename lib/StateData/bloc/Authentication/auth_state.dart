import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:progress_state_button/progress_button.dart';

enum BtnState { idle, loading, success, fail }
class AuthState extends Equatable {
  ButtonState? ButtionState;
  AuthState({required this.ButtionState});
  @override
  List<Object?> get props => [];
}
/*
class AuthInitial extends AuthState {
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
