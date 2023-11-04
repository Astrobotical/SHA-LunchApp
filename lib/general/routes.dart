import 'package:flutter/material.dart';
import 'package:hla/cooks/invoiceRequestor.dart';
import 'package:hla/general/Auth/main.dart';
import 'package:hla/general/Parent.dart';
import 'package:hla/general/Auth/main.dart';
import 'package:hla/main.dart';
import 'package:hla/cooks/addMenuItem.dart';
import 'package:hla/cooks/editMenuItem.dart';
import 'package:hla/cooks/menuQrCodeGenerator.dart';
import 'package:hla/cooks/menuCounter.dart';
import 'package:hla/student/Foodstatus.dart';
import 'package:hla/student/QrScanner.dart';
import 'package:hla/student/Support.dart';

class Approuting {
  //Generic Routes
  static const String Home = '/';
  //Auth Routes
  static const String Auth = '/Auth';
  //Student Routes
  static const String tHome = '/tHome';
  static const String qrcodescanner = '/qrcodescanner';
  static const String foodstatus = '/foodstatus';
  static const String support = '/support';
  //Worker Routes
  static const String wHome = '/wHome';
  static const String additem = '/additem';
  static const String edititem = '/edititem';
  static const String qrcodegenerator = '/qrcodegenerator';
  static const String winvoiceRequestor = '/winvoiceRequestor';
  static const String menuCounter = '/menuCounter';
}

void traineeRouting(BuildContext context, String pagename) {
  switch (pagename) {}
}

void workersRouting(BuildContext context, String pagename) {
  switch (pagename) {}
}

Route<dynamic> appRoutes(RouteSettings settings) {
  switch (settings.name) {
    case Approuting.Home:
      return MaterialPageRoute(builder: (context) => MainAuth());
    default:
      return MaterialPageRoute(builder: (context) => const MainAuth());
  }
}

Route<dynamic> RoutesGenerator(RouteSettings settings) {
  switch (settings.name) {
    case Approuting.support:
    return _pageBuildor((_) => const SupportWidget(), settings: settings);
    case Approuting.foodstatus:
    return _pageBuildor((_) => const FoodStatus(), settings: settings);
    case Approuting.qrcodescanner:
    return _pageBuildor((_) => const QrScanner(), settings: settings);
    case Approuting.additem:
      return _pageBuildor((_) => const AdditemWidget(), settings: settings);
    case Approuting.edititem:
      return _pageBuildor((_) => const editMenuItem(), settings: settings);
    case Approuting.qrcodegenerator:
      return _pageBuildor((_) => const MenuQrGenerator(), settings: settings);
    case Approuting.winvoiceRequestor:
      return _pageBuildor((_) => const InvoiceRequestor(), settings: settings);
    case Approuting.menuCounter:
      return _pageBuildor((_) => const MenuCounterWidget(), settings: settings);
    case Approuting.Auth:
      return _pageBuildor((_) => MainAuth(), settings: settings);
    case Approuting.Home:
      return _pageBuildor((_) => Parent(), settings: settings);
    default:
      return _pageBuildor((context) => const MainAuth(), settings: settings);
  }
}

//App Routing with animations
PageRouteBuilder<dynamic> _pageBuildor(
  Widget Function(BuildContext) page, {
  required RouteSettings settings,
}) {
  return PageRouteBuilder(
      settings: settings,
      transitionsBuilder: (_, animation, __, child) => FadeTransition(
            opacity: animation,
            child: child,
          ),
      pageBuilder: (context, _, __) => page(context));
}
