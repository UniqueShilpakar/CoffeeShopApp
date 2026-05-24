import 'cart_item_model.dart';

enum OrderStatus { pending, preparing, ready, delivered, cancelled }

class OrderModel {
  final String id;
  final List<CartItemModel> items;
  final OrderStatus status;
  final DateTime createdAt;
  final double total;
  final String address;

  const OrderModel({
    required this.id,
    required this.items,
    required this.status,
    required this.createdAt,
    required this.total,
    required this.address,
  });
}