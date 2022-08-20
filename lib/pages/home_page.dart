import 'package:fapp/models/catalog.dart';
import 'package:fapp/widgets/item_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:flutter/services.dart';

import '../widgets/drawer.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final String day = "mayer";

  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(Duration(seconds: 2));
    var catalogJson = await rootBundle.loadString("assets/files/catalog.json");
    var decodedData = jsonDecode(catalogJson);
    final productsData = decodedData["products"];
    CatelogModal.items = List.from(productsData)
        .map<Item>((item) => Item.fromMap(item))
        .toList();
    setState(() {});
    // print(productsData);1
    // print(decodedData.runtimeType);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Catalog App",
          style: TextStyle(color: Colors.black, fontSize: 23),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(1.0),
        child: (CatelogModal.items != null && CatelogModal.items.isNotEmpty)
            ?
            // ListView.builder(
            //     itemCount: CatelogModal.items.length,
            //     itemBuilder: (context, index) {
            //       return ItemWidget(
            //         item: CatelogModal.items[index],
            //       );
            //     },
            //   )
            GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 16),
                itemBuilder: (context, index) {
                  final item = CatelogModal.items[index];
                  return Card(
                    clipBehavior: Clip.antiAlias,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    child: GridTile(
                      header: Container(
                        child: Text(item.name,style: TextStyle(color: Colors.white),),
                        padding:const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.deepPurpleAccent,

                        ),
                      ),
                      child: Image.network(item.image),
                      footer:Container(
                        child: Text(item.price.toString(),style: TextStyle(color: Colors.white),),
                        padding:const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.black,

                        ),
                      ),
                    ),
                  );
                },
                itemCount: CatelogModal.items.length,
              )
            : Center(
                child: CircularProgressIndicator(),
              ),
      ),
      drawer: MyDrawer(),
    );
  }
}
