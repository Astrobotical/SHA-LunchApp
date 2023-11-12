import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

class mainUser extends Equatable {
  String? Name;
  String? Email;
  bool? isStudent;
  int? ID;
  mainUser(
      {required this.Name,
      required this.Email,
      required this.isStudent,
      required this.ID});
  @override
  // TODO: implement props
  List<Object?> get props => [ID, Name, Email, isStudent];

}
