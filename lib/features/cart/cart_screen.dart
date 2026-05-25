import 'package:coffee_shpo/app/routes.dart';
import 'package:coffee_shpo/core/constatnts/app_colors.dart';
import 'package:coffee_shpo/shared/widgets/bottom_nav_bar.dart';
import 'package:coffee_shpo/shared/widgets/caffora_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'cart_controller.dart';
import 'widgets/cart_item_tile.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CartController());

    return Scaffold(
      backgroundColor: AppColors.background,
      bottomNavigationBar: CafforaBottomNavBar(
        currentIndex: 2,
        onTap: (i) {
          if (i == 0) Get.offNamed(AppRoutes.home);
          if (i == 1) Get.toNamed(AppRoutes.menu);
          if (i == 3) Get.toNamed(AppRoutes.profile);
        },
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Gap(20),
              const Text(
                'Your Cart',
                style: TextStyle(
                  fontFamily: 'PlayfairDisplay',
                  fontSize: 26,
                  fontWeight: FontWeight.w700,
                  color: AppColors.textDark,
                ),
              ).animate().fadeIn(duration: 400.ms),

              const Gap(20),

              Expanded(
                child: Obx(() => controller.items.isEmpty
                    ? Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.shopping_bag_outlined,
                                size: 72,
                                color: AppColors.divider),
                            const Gap(16),
                            const Text(
                              'Your cart is empty',
                              style: TextStyle(
                                fontFamily: 'DMSans',
                                fontSize: 16,
                                color: AppColors.textLight,
                              ),
                            ),
                            const Gap(12),
                            GestureDetector(
                              onTap: () => Get.toNamed(AppRoutes.menu),
                              child: const Text(
                                'Browse Menu',
                                style: TextStyle(
                                  fontFamily: 'DMSans',
                                  fontSize: 14,
                                  color: AppColors.primary,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    : ListView.builder(
                        itemCount: controller.items.length,
                        itemBuilder: (context, i) => CartItemTile(
                          item: controller.items[i],
                          index: i,
                        ).animate().fadeIn(
                            delay: Duration(milliseconds: i * 60),
                            duration: 400.ms),
                      )),
              ),

              // Summary + checkout
              Obx(() => controller.items.isNotEmpty
                  ? Column(
                      children: [
                        const Divider(color: AppColors.divider),
                        const Gap(12),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Total',
                              style: TextStyle(
                                fontFamily: 'DMSans',
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: AppColors.textDark,
                              ),
                            ),
                            Text(
                              'Rs. ${controller.total.toInt()}',
                              style: const TextStyle(
                                fontFamily: 'PlayfairDisplay',
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                                color: AppColors.primary,
                              ),
                            ),
                          ],
                        ),
                        const Gap(16),
                        CafforaButton(
                          label: 'Proceed to Checkout',
                          onPressed: () =>
                              Get.toNamed(AppRoutes.checkout),
                        ),
                        const Gap(16),
                      ],
                    )
                  : const SizedBox.shrink()),
            ],
          ),
        ),
      ),
    );
  }
}