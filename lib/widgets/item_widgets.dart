import 'package:fapp/models/catalog.dart';
import 'package:flutter/material.dart';

class ItemWidget extends StatelessWidget {
  // const ItemWidget({super.key});
  final Item item;

  const ItemWidget({Key? key, required this.item})
      : assert(item != null),
        super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Card(
        elevation: 0.5,
        child: ListTile(
          onTap: () {
            print("${item.name} pressed");
          },
          leading: Image.network(item.image),
          title: Text(item.name),
          subtitle: Text(item.desc),
          // hoverColor: Colors.deepPurpleAccent,
          // trailing: Text("\$${item.price}"),
          trailing: Text("\$" + item.price.toString(),
              textScaleFactor: 1.2,
              style: TextStyle(
                color: Colors.deepPurple,
                fontWeight: FontWeight.bold,
              )),
        ),
      ),
    );
  }
}
