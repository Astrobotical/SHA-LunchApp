// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';
class MenuItemModel extends Equatable {
  final String foodName;
  final String description;
  final String foodImage;
  final String foodCategory;
  final bool isSide;
  final bool menuId;
  
  const MenuItemModel({
    required this.foodName,
    required this.description,
    required this.foodImage,
    required this.foodCategory,
    required this.isSide,
    required this.menuId,
  });
  MenuItemModel copyWith({
    String? foodName,
    String? description,
    String? foodImage,
    String? foodCategory,
    bool? isSide,
    bool? menuId,
  }) {
    return MenuItemModel(
      foodName: foodName ?? this.foodName,
      description: description ?? this.description,
      foodImage: foodImage ?? this.foodImage,
      foodCategory: foodCategory ?? this.foodCategory,
      isSide: isSide ?? this.isSide,
      menuId: menuId ?? this.menuId,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'foodName': foodName,
      'description': description,
      'foodImage': foodImage,
      'foodCategory': foodCategory,
      'isSide': isSide,
      'menuId': menuId,
    };
  }

  factory MenuItemModel.fromMap(Map<String, dynamic> map) {
    return MenuItemModel(
      foodName: map['foodName'] as String,
      description: map['description'] as String,
      foodImage: map['foodImage'] as String,
      foodCategory: map['foodCategory'] as String,
      isSide: map['isSide'] as bool,
      menuId: map['menuId'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory MenuItemModel.fromJson(String source) => MenuItemModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props {
    return [
      foodName,
      description,
      foodImage,
      foodCategory,
      isSide,
      menuId,
    ];
  }
}
