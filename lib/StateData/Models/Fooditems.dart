// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Fooditems {
  String? ItemID;
  String? ItemName;
  String? ItemImage;
  String? ItemDescription;
  String? ItemCategory;
  String? ItemTarget;
  String? SideTarget;
  double? ItemRating;
  Fooditems({
    this.ItemID,
    this.ItemName,
    this.ItemImage,
    this.ItemDescription,
    this.ItemCategory,
    this.ItemTarget,
    this.SideTarget,
    this.ItemRating,
  });

  Fooditems copyWith({
    String? ItemID,
    String? ItemName,
    String? ItemImage,
    String? ItemDescription,
    String? ItemCategory,
    String? ItemTarget,
    String? SideTarget,
    double? ItemRating,
  }) {
    return Fooditems(
      ItemID: ItemID ?? this.ItemID,
      ItemName: ItemName ?? this.ItemName,
      ItemImage: ItemImage ?? this.ItemImage,
      ItemDescription: ItemDescription ?? this.ItemDescription,
      ItemCategory: ItemCategory ?? this.ItemCategory,
      ItemTarget: ItemTarget ?? this.ItemTarget,
      SideTarget: SideTarget ?? this.SideTarget,
      ItemRating: ItemRating ?? this.ItemRating,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'ItemID': ItemID,
      'ItemName': ItemName,
      'ItemImage': ItemImage,
      'ItemDescription': ItemDescription,
      'ItemCategory': ItemCategory,
      'ItemTarget': ItemTarget,
      'SideTarget': SideTarget,
      'ItemRating': ItemRating,
    };
  }

  factory Fooditems.fromMap(Map<String, dynamic> map) {
    return Fooditems(
      ItemID: map['ItemID'] != null ? map['ItemID'] as String : null,
      ItemName: map['ItemName'] != null ? map['ItemName'] as String : null,
      ItemImage: map['ItemImage'] != null ? map['ItemImage'] as String : null,
      ItemDescription: map['ItemDescription'] != null ? map['ItemDescription'] as String : null,
      ItemCategory: map['ItemCategory'] != null ? map['ItemCategory'] as String : null,
      ItemTarget: map['ItemTarget'] != null ? map['ItemTarget'] as String : null,
      SideTarget: map['SideTarget'] != null ? map['SideTarget'] as String : null,
      ItemRating: map['ItemRating'] != null ? map['ItemRating'] as double : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Fooditems.fromJson(String source) => Fooditems.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Fooditems(ItemID: $ItemID, ItemName: $ItemName, ItemImage: $ItemImage, ItemDescription: $ItemDescription, ItemCategory: $ItemCategory, ItemTarget: $ItemTarget, SideTarget: $SideTarget, ItemRating: $ItemRating)';
  }

  @override
  bool operator ==(covariant Fooditems other) {
    if (identical(this, other)) return true;
  
    return 
      other.ItemID == ItemID &&
      other.ItemName == ItemName &&
      other.ItemImage == ItemImage &&
      other.ItemDescription == ItemDescription &&
      other.ItemCategory == ItemCategory &&
      other.ItemTarget == ItemTarget &&
      other.SideTarget == SideTarget &&
      other.ItemRating == ItemRating;
  }

  @override
  int get hashCode {
    return ItemID.hashCode ^
      ItemName.hashCode ^
      ItemImage.hashCode ^
      ItemDescription.hashCode ^
      ItemCategory.hashCode ^
      ItemTarget.hashCode ^
      SideTarget.hashCode ^
      ItemRating.hashCode;
  }
}
