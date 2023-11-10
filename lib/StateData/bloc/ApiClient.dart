import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class ApiClient {
  Future<Response> userLogin(String studentID, String password) async {
    final response = await http.post(
        Uri.parse("https://api.romarioburke.com/api/v1/auth/login"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(
            <String, String>{'StudentID': studentID, 'Password': password}));
    return response;
  }

  Future<Response> userRegistration(String name, String email, String status,
      String studentID, String password) async {
    final response = await http.post(
        Uri.parse("https://api.romarioburke.com/api/v1/auth/register"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'Name': name,
          'Email': email,
          'StudentID': studentID,
          'Password': password,
          'Status': status
        }));
    return response;
  }

  Future<Response> userForgetPassword(String studentID, String password) async {
    final response = await http.post(
        Uri.parse("https://api.romarioburke.com/api/v1/verify/verifySTID"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(
            <String, String>{'StudentID': studentID, 'Password': password}));
    return response;
  }

  Future<Response> userUpdatePassword(
      String studentID, String updatedPassword) async {
    final response = await http.post(
        Uri.parse("https://api.romarioburke.com/api/v1/auth/updatepassword"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'StudentID': studentID,
          'NewPassword': updatedPassword
        }));
    return response;
  }

  Future<Response> tokenValidator(String token) async {
    final response = await http.post(
        Uri.parse("https://api.romarioburke.com/api/v1/verify/validatetoken"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{'token': token}));
    return response;
  }

  Future<Response> getActiveMenu() async {
    final response = await http.get(
      Uri.parse("https://api.romarioburke.com/api/v1/catalogs"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    return response;
  }

  Future<Response> getMenuItems() async {
    final response = await http.get(
      Uri.parse("https://api.romarioburke.com/api/v1/catalogs"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    return response;
  }
  Future<Response> deleteMenuitem(String itemID) async{
     final response = await http.post(
      Uri.parse("https://api.romarioburke.com/api/v1/catalogs"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
        body: jsonEncode(<String, String>{'Item_id': itemID})
    );
    return response;
  }
}
