import 'package:flutter/material.dart';

class Suspect extends StatefulWidget {
  @override
  _SuspectState createState() => _SuspectState();
}

class _SuspectState extends State<Suspect> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Suspect'),
        centerTitle: true,
      ),
    );
  }
}