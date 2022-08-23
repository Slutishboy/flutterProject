// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/services.dart';
import 'package:velocity_x/velocity_x.dart';

import 'package:fapp/models/catalog.dart';
import 'package:fapp/widgets/item_widgets.dart';
import 'package:fapp/widgets/themes.dart';

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
        backgroundColor: MyTheme.creamColor,
        // appBar: AppBar(
        //   title: Text(
        //     "Catalog App",
        //     style: TextStyle(color: Colors.black, fontSize: 23),
        //   ),
        // ),
        // body: Padding(
        //   padding: const EdgeInsets.all(1.0),
        //   child: (CatelogModal.items != null && CatelogModal.items.isNotEmpty)
        //       ?
        //       // ListView.builder(
        //       //     itemCount: CatelogModal.items.length,
        //       //     itemBuilder: (context, index) {
        //       //       return ItemWidget(
        //       //         item: CatelogModal.items[index],
        //       //       );
        //       //     },
        //       //   )
        //       GridView.builder(
        //           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        //               crossAxisCount: 2,
        //               mainAxisSpacing: 16,
        //               crossAxisSpacing: 16),
        //           itemBuilder: (context, index) {
        //             final item = CatelogModal.items[index];
        //             return Card(
        //               clipBehavior: Clip.antiAlias,
        //               shape: RoundedRectangleBorder(
        //                   borderRadius: BorderRadius.circular(15)),
        //               child: GridTile(
        //                 header: Container(
        //                   child: Text(item.name,style: TextStyle(color: Colors.white),),
        //                   padding:const EdgeInsets.all(12),
        //                   decoration: BoxDecoration(
        //                     color: Colors.deepPurpleAccent,

        //                   ),
        //                 ),
        //                 child: Image.network(item.image),
        //                 footer:Container(
        //                   child: Text(item.price.toString(),style: TextStyle(color: Colors.white),),
        //                   padding:const EdgeInsets.all(12),
        //                   decoration: BoxDecoration(
        //                     color: Colors.black,

        //                   ),
        //                 ),
        //               ),
        //             );
        //           },
        //           itemCount: CatelogModal.items.length,
        //         )
        //       : Center(
        //           child: CircularProgressIndicator(),
        //         ),
        // ),
        // drawer: MyDrawer(),
        body: SafeArea(
          child: Container(
            padding: Vx.m32,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CatalogHeader(),
                if (CatelogModal.items != null && CatelogModal.items.isNotEmpty)
                  CatalogList().expand()
                else
                  Center(child: CircularProgressIndicator())
              ],
            ),
          ),
        ));
  }
}

class CatalogHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        "Catalog App".text.xl5.bold.color(MyTheme.darkBlueColor).make(),
        "Trending products".text.xl2.make(),
      ],
    );
  }
}

class CatalogList extends StatelessWidget {
  const CatalogList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: CatelogModal.items.length,
      itemBuilder: (context, index) {
        final catalog = CatelogModal.items[index];
        return CatalogItem(catalog: catalog);
      },
    );
  }
}

class CatalogItem extends StatelessWidget {
  //  const CatalogItem({super.key});
  final Item catalog;
  const CatalogItem({required this.catalog}) : assert(catalog != null);
  @override
  Widget build(BuildContext context) {
    return VxBox(
        child: Row(
      children: [
        CatalogImage(image: catalog.image),
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            catalog.name.text.lg.color(MyTheme.darkBlueColor).bold.make(),
            catalog.desc.text.textStyle(context.captionStyle).make(),
            10.heightBox,
            ButtonBar(
              alignment: MainAxisAlignment.spaceBetween,
              buttonPadding: EdgeInsets.zero,
              children: [
                "\$${catalog.price}".text.bold.xl.make(),
                ElevatedButton(
                    onPressed: (() {}),
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(MyTheme.darkBlueColor),
                            shape: MaterialStateProperty.all(StadiumBorder())),
                    child: "Buy".text.make())
              ],
            ).pOnly(right: 8)
          ],
        ))
      ],
    )).white.rounded.square(140).make().py16();
  }
}

class CatalogImage extends StatelessWidget {
  final String image;
  const CatalogImage({
    Key? key,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.network(image)
        .box
        .rounded
        .color(MyTheme.creamColor)
        .p8
        .make()
        .p16()
        .w40(context);
  }
}
