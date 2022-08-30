import 'package:fapp/widgets/themes.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.canvasColor,
      appBar: AppBar(backgroundColor: Colors.transparent
      ,title: "Cart".text.make(),),
      body: Column(children: [
        CartList().p32().expand(),
        Divider(),
        _CartTotal(),
      ],),
    );
  }
}

class _CartTotal extends StatelessWidget {
  const _CartTotal({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          "\$9999".text.xl4.color(context.accentColor).make(),
          30.widthBox,
          ElevatedButton(onPressed: (){},style: ButtonStyle(backgroundColor: MaterialStateProperty.all(context.theme.buttonColor),
          shape: MaterialStateProperty.all(StadiumBorder())), child: "Buy".text.color(Colors.white).make()).w32(context)
        ],
      ),
    );
  }
}

class CartList extends StatefulWidget {
  const CartList({super.key});

  @override
  State<CartList> createState() => _CartListState();
}

class _CartListState extends State<CartList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 5,
      itemBuilder: ((context, index) => ListTile(
        leading: Icon(Icons.done),
        trailing: IconButton(onPressed: (){}, icon: Icon(Icons.remove_circle_outline)),
        title: "Item1".text.make(),
      )),
    );
  }
}