import 'package:fapp/models/catalog.dart';
import 'package:fapp/widgets/item_widgets.dart';
import 'package:flutter/material.dart';

import '../widgets/drawer.dart';

class HomePage extends StatelessWidget {
  final String day = "mayer";

  @override
  Widget build(BuildContext context) {
    final dummyList = List.generate(20, (index) => CatelogModal.items[0]);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Catalog App",
          style: TextStyle(color: Colors.black, fontSize: 23),
        ),
      ),
      body: ListView.builder(
        itemCount: dummyList.length,
        itemBuilder: (context, index) {
          return ItemWidget(item: dummyList[index],);
        },
      ),
      drawer: MyDrawer(),
    );
  }
}
