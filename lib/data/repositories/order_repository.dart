

import 'package:coffee_shpo/data/models/cart_item_model.dart';
import 'package:coffee_shpo/data/models/order_model.dart';

class OrderRepository {
  final List<OrderModel> _orders = [];

  List<OrderModel> get orders => List.unmodifiable(_orders);

  Future<OrderModel> placeOrder({
    required List<CartItemModel> items,
    required String address,
  }) async {
    await Future.delayed(const Duration(seconds: 1));
    final order = OrderModel(
      id: 'ORD-${DateTime.now().millisecondsSinceEpoch}',
      items: items,
      status: OrderStatus.pending,
      createdAt: DateTime.now(),
      total: items.fold(0, (s, i) => s + i.totalPrice),
      address: address,
    );
    _orders.add(order);
    return order;
  }
}