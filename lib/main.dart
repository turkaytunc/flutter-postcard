import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: App()
  ));
}

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Post Fetch App'),
        centerTitle: true,
      ),
      body: Text('Posts'),
    );
  }
}

