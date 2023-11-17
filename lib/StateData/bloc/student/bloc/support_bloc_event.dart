part of 'support_bloc_bloc.dart';

sealed class SupportBlocEvent extends Equatable {
  const SupportBlocEvent();

  @override
  List<Object> get props => [];
}

class Onchanged extends SupportBlocEvent {}

class OnFeedbackSubmit extends SupportBlocEvent {}

class OnSubmit extends SupportBlocEvent {}
class Successsubmit extends SupportBlocEvent{}