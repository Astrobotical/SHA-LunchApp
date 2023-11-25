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
  Future<Response> userRegistration(String name, String email, String status, String studentID, String password) async {
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
      Uri.parse("https://api.romarioburke.com/api/v1/cart/getmenu"),
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

  Future<Response> ActiveMenuChecker() async {
    final response = await http.get(
      Uri.parse("https://api.romarioburke.com/api/v1/cart/getmenu"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    return response;
  }

  Future<Response> deleteMenuitem(String itemID) async {
    final response = await http.post(
        Uri.parse("https://api.romarioburke.com/api/v1/catalogs"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{'Item_id': itemID}));
    return response;
  }

  Future<Response> sendFeedbacks(
      String studentID, String type, String feedback) async {
    final response = await http.post(
        Uri.parse("https://api.romarioburke.com/api/v1/feeds/reportfeedback"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'StudentID': studentID,
          'Feedback': feedback,
          'Type': type
        }));
    return response;
  }

  Future<StreamedResponse> addMenuItem(String filelocation, String foodName,
      String category, String studentType, String mealType) async {
    Map<String, String> headers = {
      'Content-Type': 'multipart/form-data',
    };
    Map<String, String> body = {
      'Item_id': DateTime.now().millisecondsSinceEpoch.toString(),
      'Item_category': category,
      'Item_description': "filler",
      'Item_Target': studentType,
      'Side_Target': mealType,
      'Item_name': foodName,
    };
    final response = await http.MultipartRequest(
        'POST', Uri.parse("https://api.romarioburke.com/api/v1/Items/Additem"))
      ..fields.addAll(body)
      ..headers.addAll(headers)
      ..files
          .add(await http.MultipartFile.fromPath('Item_image', filelocation));
    return response.send();
  }

  Future<Response> accountPresent(String email) async {
    final response = await http.post(
        Uri.parse("https://api.romarioburke.com/api/v1/auth/hasaccount"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'Email': email,
        }));
    return response;
  }

  Future<Response> cartCheckout(data, String menuID, String studentID) async {
    //print(data);
    final item = jsonDecode(data);
    Map<String, dynamic> test = {
      "StudentID": studentID,
      "MenuID": menuID,
      "Data": item
    };
    print(test);
    final response = await http.post(
        Uri.parse("https://api.romarioburke.com/api/v1/cart/checkout"),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body:
         jsonEncode(<String, Object>{
          'StudentID': studentID,
          'MenuID': menuID,
          'Data': item
        }) );
    return response;
  }

  Future<Response>  getInvoices(String studentID) async {
    final response = await http.post(
        Uri.parse("https://api.romarioburke.com/api/v1/invoices/getinvoice"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, Object>{
          'StudentID': studentID,
        }));
    return response;
  }

  Future<Response> requestInvoice(
    String invoiceID,
  ) async {
    final response = await http.post(
        Uri.parse(
            "https://api.romarioburke.com/api/v1/invoices/requestinvoice"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, Object>{
          'InvoiceID': invoiceID,
        }));
    return response;
  }
}
