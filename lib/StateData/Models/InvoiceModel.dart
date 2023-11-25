// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:intl/intl.dart';

class InvoiceModel {
  String InvoiceID;
  String MenuID;
  String Status;
  String? Date;
  InvoiceModel({
    required this.InvoiceID,
    required this.MenuID,
    required this.Status,
    required this.Date,
  });

  InvoiceModel copyWith({
    String? InvoiceID,
    String? MenuID,
    String? Status,
    String? Date,
  }) {
    return InvoiceModel(
      InvoiceID: InvoiceID ?? this.InvoiceID,
      MenuID: MenuID ?? this.MenuID,
      Status: Status ?? this.Status,
      Date: Date ?? this.Date,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'InvoiceID': InvoiceID,
      'MenuID': MenuID,
      'Status': Status,
      'Date': Date,
    };
  }

  factory InvoiceModel.fromMap(Map<String, dynamic> map) {
    return InvoiceModel(
      InvoiceID: map['InvoiceID'] as String,
      MenuID: map['MenuID'] as String,
      Status: map['Status'] as String,
      Date: map['Date'] != null ? map['Date'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory InvoiceModel.fromJson(String source) => InvoiceModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'InvoiceModel(InvoiceID: $InvoiceID, MenuID: $MenuID, Status: $Status, Date: $Date)';
  }

  @override
  bool operator ==(covariant InvoiceModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.InvoiceID == InvoiceID &&
      other.MenuID == MenuID &&
      other.Status == Status &&
      other.Date == Date;
  }

  @override
  int get hashCode {
    return InvoiceID.hashCode ^
      MenuID.hashCode ^
      Status.hashCode ^
      Date.hashCode;
  }
}
