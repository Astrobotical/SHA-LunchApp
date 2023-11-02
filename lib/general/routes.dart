import 'package:flutter/material.dart';
import 'package:hla/general/Auth/main.dart';
import 'package:hla/general/Parent.dart';
import 'package:hla/general/Auth/main.dart';
import 'package:hla/main.dart';

class Approuting {
  //Generic Routes
  static const String Home = '/';
  //Auth Routes
  static const String Auth = '/Auth';
  //Student Routes
  static const String tHome = '/tHome';
  //Worker Routes
  static const String wHome = '/wHome';
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
