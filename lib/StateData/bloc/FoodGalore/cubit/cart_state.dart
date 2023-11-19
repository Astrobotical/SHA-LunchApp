part of 'cart_cubit.dart';

sealed class CartState extends Equatable {
  const CartState();

  @override
  List<Object> get props => [];
}

final class CartInitial extends CartState {}

final class CartStartup extends CartState {}
final class Cartloading extends CartState{}

final class CartPopulate extends CartState {}

final class CartPopulateDone extends CartState {}
final class CartDeleteSuccess extends CartState{}
