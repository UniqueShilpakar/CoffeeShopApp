import 'product_model.dart';

class CartItemModel {
  final ProductModel product;
  int quantity;
  String? selectedSize;

  CartItemModel({
    required this.product,
    this.quantity = 1,
    this.selectedSize,
  });

  double get totalPrice => product.price * quantity;
}