import 'package:flutter/material.dart';

import '../widgets/drawer.dart';

class HomePage extends StatelessWidget {
  final String day = "mayer";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(        
        title:  Text("Catalog App",style: TextStyle(color: Colors.black,fontSize: 23),),
      ),
      body: Center(
        child: Container(
          child: Text("helo $day world today"),
        ),
      ),
      drawer: MyDrawer(),
    );
  }
}
  