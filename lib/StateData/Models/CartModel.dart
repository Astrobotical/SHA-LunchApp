// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class CartModel {
  String MenuID;

  String FoodID;  
  String FoodName;
  String FoodImage;

  String SideID;
  String SideFoodName;
  String SideFoodImage;
  String FoodCategory;
  int? AIN; 
  CartModel({
    required this.MenuID,
    required this.FoodID,
    required this.FoodName,
    required this.FoodImage,
    required this.SideID,
    required this.SideFoodName,
    required this.SideFoodImage,
    required this.FoodCategory,
    this.AIN,
  });

  CartModel copyWith({
    String? MenuID,
    String? FoodID,
    String? FoodName,
    String? FoodImage,
    String? SideID,
    String? SideFoodName,
    String? SideFoodImage,
    String? FoodCategory,
    int? AIN,
  }) {
    return CartModel(
      MenuID: MenuID ?? this.MenuID,
      FoodID: FoodID ?? this.FoodID,
      FoodName: FoodName ?? this.FoodName,
      FoodImage: FoodImage ?? this.FoodImage,
      SideID: SideID ?? this.SideID,
      SideFoodName: SideFoodName ?? this.SideFoodName,
      SideFoodImage: SideFoodImage ?? this.SideFoodImage,
      FoodCategory: FoodCategory ?? this.FoodCategory,
      AIN: AIN ?? this.AIN,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'MenuID': MenuID,
      'FoodID': FoodID,
      'FoodName': FoodName,
      'FoodImage': FoodImage,
      'SideID': SideID,
      'SideFoodName': SideFoodName,
      'SideFoodImage': SideFoodImage,
      'FoodCategory': FoodCategory,
      'AIN': AIN,
    };
  }

  factory CartModel.fromMap(Map<String, dynamic> map) {
    return CartModel(
      MenuID: map['MenuID'] as String,
      FoodID: map['FoodID'] as String,
      FoodName: map['FoodName'] as String,
      FoodImage: map['FoodImage'] as String,
      SideID: map['SideID'] as String,
      SideFoodName: map['SideFoodName'] as String,
      SideFoodImage: map['SideFoodImage'] as String,
      FoodCategory: map['FoodCategory'] as String,
      AIN: map['AIN'] != null ? map['AIN'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory CartModel.fromJson(String source) => CartModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'CartModel(MenuID: $MenuID, FoodID: $FoodID, FoodName: $FoodName, FoodImage: $FoodImage, SideID: $SideID, SideFoodName: $SideFoodName, SideFoodImage: $SideFoodImage, FoodCategory: $FoodCategory, AIN: $AIN)';
  }

  @override
  bool operator ==(covariant CartModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.MenuID == MenuID &&
      other.FoodID == FoodID &&
      other.FoodName == FoodName &&
      other.FoodImage == FoodImage &&
      other.SideID == SideID &&
      other.SideFoodName == SideFoodName &&
      other.SideFoodImage == SideFoodImage &&
      other.FoodCategory == FoodCategory &&
      other.AIN == AIN;
  }

  @override
  int get hashCode {
    return MenuID.hashCode ^
      FoodID.hashCode ^
      FoodName.hashCode ^
      FoodImage.hashCode ^
      SideID.hashCode ^
      SideFoodName.hashCode ^
      SideFoodImage.hashCode ^
      FoodCategory.hashCode ^
      AIN.hashCode;
  }
}
