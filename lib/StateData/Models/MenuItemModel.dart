import 'package:equatable/equatable.dart';
class MenuItemModel extends Equatable{
  final String foodName;
  final String description;
  final String foodImage;
  final String foodCategory;
  final bool isSide;
  final bool menuId;
  
  MenuItemModel({
    required this.foodName,
    required this.description,
    required this.foodImage,
    required this.foodCategory,
    required this.isSide,
    required this.menuId,
  });

  MenuItemModel.fromJson(Map<String, dynamic> json)
      : foodName = json['foodName'],
        description = json['description'],
        foodImage = json['foodImage'],
        foodCategory = json['foodCategory'],
        isSide = json['isSide'],
        menuId = json['menuId'];

  Map<String, dynamic> toJson() {
    return{
        'foodName': foodName,
        'description': description,
        'foodImage': foodImage,
        'foodCategory': foodCategory,
        'isSide': isSide,
        'menuId': menuId,
      };
  }
  
  @override
  // TODO: implement props
  List<Object?> get props => [foodName,description,foodImage,foodCategory,isSide,menuId];
  

}
