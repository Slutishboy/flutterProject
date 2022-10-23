import 'package:fapp/core/store.dart';
import 'package:fapp/models/cart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../models/catalog.dart';

class AddToCart extends StatelessWidget {
  final Item catalog;
  AddToCart({Key? key, required this.catalog}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    VxState.listen(context, to: [AddMutation]);
    final CartModal _cart = (VxState.store as MyStore).cart;

    bool isInCart = _cart.items.contains(catalog) ?? false;

    return ElevatedButton(
        onPressed: (() {
          if (!isInCart) {
            AddMutation(catalog);
          
          }
        }),
        style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.all(context.theme.buttonColor),
            shape: MaterialStateProperty.all(StadiumBorder())),
        child: isInCart
            ? Icon(Icons.done)
            : Icon(CupertinoIcons.cart_fill_badge_plus));
  }
}
