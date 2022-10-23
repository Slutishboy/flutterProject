import 'package:fapp/models/cart.dart';
import 'package:fapp/models/catalog.dart';
import 'package:velocity_x/velocity_x.dart';

class MyStore extends VxStore {
  late CatelogModal catalog;
  late CartModal cart;
  MyStore() {
    catalog = CatelogModal();
    cart = CartModal();
    cart.catalog = catalog;
  }
}
