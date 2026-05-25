import 'package:get/get.dart';
import '../../data/models/cart_item_model.dart';
import '../../data/models/product_model.dart';

class CartController extends GetxController {
  final RxList<CartItemModel> items = <CartItemModel>[].obs;

  double get total => items.fold(0, (s, i) => s + i.totalPrice);
  int get itemCount => items.fold(0, (s, i) => s + i.quantity);

  void addItem(ProductModel product, {String? size}) {
    final index = items.indexWhere(
      (i) => i.product.id == product.id && i.selectedSize == size,
    );
    if (index >= 0) {
      items[index].quantity++;
      items.refresh();
    } else {
      items.add(CartItemModel(product: product, selectedSize: size));
    }
  }

  void removeItem(String productId) =>
      items.removeWhere((i) => i.product.id == productId);

  void increment(int index) {
    items[index].quantity++;
    items.refresh();
  }

  void decrement(int index) {
    if (items[index].quantity > 1) {
      items[index].quantity--;
      items.refresh();
    } else {
      items.removeAt(index);
    }
  }

  void clear() => items.clear();
}