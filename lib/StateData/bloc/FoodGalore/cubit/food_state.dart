part of 'food_cubit.dart';

sealed class FoodState extends Equatable {
  const FoodState();

  @override
  List<Object> get props => [];
}

final class FoodInitial extends FoodState {

}
final class MenuChecker extends FoodState{
  bool isActiveMenu;
  MenuChecker({required this.isActiveMenu});
}
final class FoodLoading extends FoodState{

}
final class Foodempty extends FoodState{

}
final class FoodDoneLoading extends FoodState{

}
