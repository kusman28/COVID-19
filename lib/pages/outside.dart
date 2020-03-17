import 'package:flutter/material.dart';

class Outside extends StatefulWidget {
  @override
  _OutsideState createState() => _OutsideState();
}

class _OutsideState extends State<Outside> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Outside PH'),
        centerTitle: true,
      ),
    );
  }
}