import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hla/StateData/Models/InvoiceModel.dart';
import 'package:hla/StateData/bloc/ApiClient.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'invoices_state.dart';

class InvoicesCubit extends Cubit<InvoicesState> {
  InvoicesCubit() : super(InvoicesInitial());
  ApiClient api = ApiClient();
  List<InvoiceModel> invoices = [];
  //List Sorted = [];
  Future<List<InvoiceModel>> getInvoices() async {
    final prefs = await SharedPreferences.getInstance();
    String? StudentID = prefs.getString('ID');
    Response result = await api.getInvoices(StudentID!);
    List data = [];
    if (result.statusCode == 200) {
      final parsed = jsonDecode(result.body);
      final Map<String, dynamic> items = jsonDecode(result.body);
      Iterable Data = items['data'];
     data = parsed['data'];
      invoices = List.generate(data.length, (index) => InvoiceModel.fromMap(data[index]));
      print(invoices);
      return invoices;
    } else {}
    return Future.value([]);
  }

  Future<void> requestinvoice(String invoiceID) async {
    Response result = await api.requestInvoice(invoiceID);
    if (result.statusCode == 200) {
     //  final parsedData = jsonDecode(result.body);
    }
  }
}
