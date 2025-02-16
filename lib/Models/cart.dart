import 'package:LoyalePets/Core/store.dart';
import 'package:LoyalePets/Models/Catalog.dart';
import 'package:velocity_x/velocity_x.dart';

class CartModel {
  // Catalog field
  late CatalogModel _catalog;

  // Collection of IDs - store IDs of each item
  final List<int> _itemIds = [];

  // Getter for catalog
  CatalogModel get catalog => _catalog;

  // Setter for catalog
  set catalog(CatalogModel newCatalog) {
    _catalog = newCatalog;
  }

  // Get list of items in the cart
  List<Item> get items => _itemIds.map((id) => _catalog.getById(id)).toList();

  // Get total price
  num get totalPrice =>
      items.fold(0, (total, current) => total + current.price);
}

class AddMutation extends VxMutation<MyStore> {
  final Item item;

  AddMutation(this.item);

  @override
  perform() {
    store?.cart._itemIds.add(item.id);
  }
}

class RemoveMutation extends VxMutation<MyStore> {
  final Item item;

  RemoveMutation(this.item);

  @override
  perform() {
    store?.cart._itemIds.remove(item.id);
  }
}
