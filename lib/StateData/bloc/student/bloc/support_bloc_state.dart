part of 'support_bloc_bloc.dart';

sealed class SupportBlocState extends Equatable {
  const SupportBlocState();
  
  @override
  List<Object> get props => [];
}

final class SupportBlocInitial extends SupportBlocState {}
final class Somethingchange extends SupportBlocState{}
