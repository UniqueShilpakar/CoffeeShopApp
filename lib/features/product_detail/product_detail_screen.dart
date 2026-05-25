import 'package:coffee_shpo/core/constatnts/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import '../../shared/widgets/caffora_button.dart';
import '../../shared/widgets/star_rating.dart';
import 'product_detail_controller.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProductDetailController());
    final product = controller.product;

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            // Image section
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: 300,
                  color: AppColors.surface,
                  child: Center(
                    child: Icon(Icons.coffee_rounded,
                        size: 100,
                        color: AppColors.primary.withOpacity(0.2)),
                    // Replace with Image.asset(product.imageAsset, fit: BoxFit.cover)
                  ),
                ),
                Positioned(
                  top: 16,
                  left: 16,
                  child: GestureDetector(
                    onTap: () => Get.back(),
                    child: Container(
                      width: 44,
                      height: 44,
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.08),
                            blurRadius: 8,
                          ),
                        ],
                      ),
                      child: const Icon(Icons.arrow_back_ios_new_rounded,
                          size: 18, color: AppColors.textDark),
                    ),
                  ),
                ),
              ],
            ).animate().fadeIn(duration: 400.ms),

            // Details
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            product.name,
                            style: const TextStyle(
                              fontFamily: 'PlayfairDisplay',
                              fontSize: 26,
                              fontWeight: FontWeight.w700,
                              color: AppColors.textDark,
                            ),
                          ),
                        ),
                        Text(
                          'Rs. ${product.price.toInt()}',
                          style: const TextStyle(
                            fontFamily: 'DMSans',
                            fontSize: 22,
                            fontWeight: FontWeight.w700,
                            color: AppColors.primary,
                          ),
                        ),
                      ],
                    ).animate().fadeIn(delay: 100.ms, duration: 400.ms),

                    const Gap(8),

                    StarRating(
                      rating: product.rating,
                      reviewCount: product.reviewCount,
                      size: 16,
                    ).animate().fadeIn(delay: 150.ms, duration: 400.ms),

                    const Gap(16),

                    Text(
                      product.description,
                      style: const TextStyle(
                        fontFamily: 'DMSans',
                        fontSize: 15,
                        color: AppColors.textMedium,
                        height: 1.6,
                      ),
                    ).animate().fadeIn(delay: 200.ms, duration: 400.ms),

                    const Gap(24),

                    // Size selector
                    const Text(
                      'Size',
                      style: TextStyle(
                        fontFamily: 'DMSans',
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: AppColors.textDark,
                      ),
                    ).animate().fadeIn(delay: 250.ms, duration: 400.ms),

                    const Gap(12),

                    Obx(() => Row(
                          children: controller.sizes.map((size) {
                            final isSelected =
                                controller.selectedSize.value == size;
                            return GestureDetector(
                              onTap: () => controller.selectSize(size),
                              child: AnimatedContainer(
                                duration: const Duration(milliseconds: 200),
                                margin: const EdgeInsets.only(right: 12),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 10),
                                decoration: BoxDecoration(
                                  color: isSelected
                                      ? AppColors.primary
                                      : AppColors.surface,
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(
                                    color: isSelected
                                        ? AppColors.primary
                                        : AppColors.divider,
                                  ),
                                ),
                                child: Text(
                                  size,
                                  style: TextStyle(
                                    fontFamily: 'DMSans',
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500,
                                    color: isSelected
                                        ? AppColors.white
                                        : AppColors.textMedium,
                                  ),
                                ),
                              ),
                            );
                          }).toList(),
                        )).animate().fadeIn(delay: 300.ms, duration: 400.ms),

                    const Gap(24),

                    // Quantity
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Quantity',
                          style: TextStyle(
                            fontFamily: 'DMSans',
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: AppColors.textDark,
                          ),
                        ),
                        Obx(() => Row(
                              children: [
                                _QtyButton(
                                    icon: Icons.remove,
                                    onTap: controller.decrement),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  child: Text(
                                    '${controller.quantity.value}',
                                    style: const TextStyle(
                                      fontFamily: 'DMSans',
                                      fontSize: 18,
                                      fontWeight: FontWeight.w700,
                                      color: AppColors.textDark,
                                    ),
                                  ),
                                ),
                                _QtyButton(
                                    icon: Icons.add,
                                    onTap: controller.increment),
                              ],
                            )),
                      ],
                    ).animate().fadeIn(delay: 350.ms, duration: 400.ms),

                    const Gap(32),

                    CafforaButton(
                      label: 'Add to Cart',
                      onPressed: controller.addToCart,
                    ).animate().fadeIn(delay: 400.ms, duration: 400.ms),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _QtyButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const _QtyButton({required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 36,
        height: 36,
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: AppColors.divider),
        ),
        child: Icon(icon, size: 18, color: AppColors.textDark),
      ),
    );
  }
}