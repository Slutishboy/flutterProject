import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final String day = "mayer";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Catalog App"),
      ),
      body: Center(
        child: Container(
          child: Text("helo $day world today"),
        ),
      ),
      drawer: Drawer(),
    );
  }
}
  