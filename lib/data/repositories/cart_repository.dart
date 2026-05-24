import 'package:coffee_shpo/data/models/cart_item_model.dart';
import 'package:coffee_shpo/data/models/product_model.dart';

class CartRepository {
  final List<CartItemModel> _items = [];

  List<CartItemModel> get items => _items;

  double get total =>
      _items.fold(0, (sum, item) => sum + item.totalPrice);

  int get itemCount =>
      _items.fold(0, (sum, item) => sum + item.quantity);

  void addItem(ProductModel product, {String? size}) {
    final index = _items.indexWhere(
      (i) => i.product.id == product.id && i.selectedSize == size,
    );
    if (index >= 0) {
      _items[index].quantity++;
    } else {
      _items.add(CartItemModel(product: product, selectedSize: size));
    }
  }

  void removeItem(String productId) =>
      _items.removeWhere((i) => i.product.id == productId);

  void updateQuantity(String productId, int quantity) {
    final index = _items.indexWhere((i) => i.product.id == productId);
    if (index >= 0) {
      if (quantity <= 0) {
        _items.removeAt(index);
      } else {
        _items[index].quantity = quantity;
      }
    }
  }

  void clear() => _items.clear();
}