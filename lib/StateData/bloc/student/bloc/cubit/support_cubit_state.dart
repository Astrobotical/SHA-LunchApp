part of 'support_cubit_cubit.dart';

sealed class SupportCubitState extends Equatable {
  const SupportCubitState();

  @override
  List<Object> get props => [];
}

final class SupportCubitInitial extends SupportCubitState {}
final class SupportCubitChanged extends SupportCubitState{}
final class SupportCubitSuccessSent extends SupportCubitState{}
final class SupportCubitError extends SupportCubitState{}
