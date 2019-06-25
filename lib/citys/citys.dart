import 'package:flutter/material.dart';

class CitysWidget extends StatefulWidget {
  @override
  _CitysWidgetState createState() => _CitysWidgetState();
}

class _CitysWidgetState extends State<CitysWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("选择城市"),
      ),
      body: Center(
        child: Text("city"),
      ),
    );
  }
}