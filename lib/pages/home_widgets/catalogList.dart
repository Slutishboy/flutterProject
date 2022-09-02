import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import 'package:fapp/models/cart.dart';
import 'package:fapp/pages/hom_detail_page.dart';
import 'package:fapp/pages/home_widgets/add_to_cart.dart';

import '../../models/catalog.dart';
import '../../widgets/themes.dart';
import 'catalogImage.dart';

class CatalogList extends StatelessWidget {
  const CatalogList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: CatelogModal.items.length,
      itemBuilder: (context, index) {
        final catalog = CatelogModal.items[index];
        return InkWell(
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => HomeDetailPage(
                          catalog: catalog,
                        ))),
            child: CatalogItem(catalog: catalog));
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
        Hero(
          tag: Key(catalog.id.toString()),
          child: CatalogImage(image: catalog.image),
        ),
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            catalog.name.text.lg.color(context.accentColor).bold.make(),
            catalog.desc.text.textStyle(context.captionStyle).make(),
            10.heightBox,
            ButtonBar(
              alignment: MainAxisAlignment.spaceBetween,
              buttonPadding: EdgeInsets.zero,
              children: [
                "\$${catalog.price}".text.bold.xl.make(),
                AddToCart(catalog: catalog)
              ],
            ).pOnly(right: 8)
          ],
        ))
      ],
    )).color(context.cardColor).rounded.square(140).make().py16();
  }
}


