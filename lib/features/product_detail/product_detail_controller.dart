import 'package:coffee_shpo/core/constatnts/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../data/models/product_model.dart';
import '../../features/cart/cart_controller.dart';

class ProductDetailController extends GetxController {
  late ProductModel product;
  final RxInt quantity        = 1.obs;
  final RxString selectedSize = 'Medium'.obs;

  final List<String> sizes = ['Small', 'Medium', 'Large'];

  @override
  void onInit() {
    super.onInit();
    product = Get.arguments as ProductModel;
  }

  void increment() => quantity.value++;
  void decrement() {
    if (quantity.value > 1) quantity.value--;
  }

  void selectSize(String size) => selectedSize.value = size;

  void addToCart() {
    final cartController = Get.find<CartController>();
    for (int i = 0; i < quantity.value; i++) {
      cartController.addItem(product, size: selectedSize.value);
    }
    Get.back();
    Get.snackbar(
      'Added to cart',
      '${quantity.value}x ${product.name}',
      backgroundColor: AppColors.primary,
      colorText: AppColors.white,
      snackPosition: SnackPosition.BOTTOM,
      margin: EdgeInsets.all(16),
      borderRadius: 12,
    );
  }
}

