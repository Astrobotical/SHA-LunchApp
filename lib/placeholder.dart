import 'package:flutter/material.dart';
import 'package:hla/cooks/addMenuItem.dart';
class PlaceholderWidget extends StatefulWidget {
  const PlaceholderWidget({super.key});

  @override
  State<PlaceholderWidget> createState() => _PlaceholderWidgetState();
}

class _PlaceholderWidgetState extends State<PlaceholderWidget> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home:Scaffold(
        body: AdditemWidget(),
      )
    );
  }
}
