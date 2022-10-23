import 'package:fapp/core/store.dart';
import 'package:fapp/models/catalog.dart';
import 'package:velocity_x/velocity_x.dart';

class CartModal {
  // static final cartModal = CartModal._internal();
  // CartModal._internal();
  // factory CartModal() => cartModal;
  late CatelogModal _catelog;
  // store Ids of each item
  final List<int> _itemIds = [];
  CatelogModal get catalog => _catelog;
  set catalog(CatelogModal newCatalog) {
    assert(newCatalog != null);
    _catelog = newCatalog;
  }

  //get item in the cart
  List<Item> get items => _itemIds.map((id) => _catelog.getById(id)).toList();

  //get total price
  num get totalPrice =>
      items.fold(0, (total, current) => total + current.price);

  // add item
  void add(Item item) {
    _itemIds.add(item.id);
  }

  //remove item
  void remove(Item item) {
    _itemIds.remove(item.id);
  }
}

class AddMutation extends VxMutation<MyStore> {
  final Item item;
  AddMutation(this.item);
  @override
  perform() {
    store.cart._itemIds.add(item.id);
  }
}
class RemoveMutation extends VxMutation<MyStore> {
  final Item item;
  RemoveMutation(this.item);
  @override
  perform() {
    store.cart._itemIds.remove(item.id);
  }
}
