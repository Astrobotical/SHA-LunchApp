import 'package:flutter/material.dart';

class itemsEditor extends StatefulWidget {
  const itemsEditor({super.key, required this.menuType});

  final String menuType;
  @override
  State<itemsEditor> createState() => _itemsEditorState();
}

class _itemsEditorState extends State<itemsEditor> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child:Text(widget.menuType,style: TextStyle(fontSize: 30),));
  }
}
