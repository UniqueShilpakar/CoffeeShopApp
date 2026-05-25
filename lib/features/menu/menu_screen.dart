import 'package:coffee_shpo/core/constatnts/app_colors.dart';
import 'package:coffee_shpo/shared/widgets/loading_shimer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import '../../app/routes.dart';

import '../../shared/widgets/bottom_nav_bar.dart';
import '../../shared/widgets/category_chip.dart';

import '../../shared/widgets/search_bar.dart';
import 'menu_controller.dart';
import 'widgets/product_card_widget.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MenuScreenController()); // ← renamed

    return Scaffold(
      backgroundColor: AppColors.background,
      bottomNavigationBar: CafforaBottomNavBar(
        currentIndex: 1,
        onTap: (i) {
          if (i == 0) Get.offNamed(AppRoutes.home);
          if (i == 2) Get.toNamed(AppRoutes.cart);
          if (i == 3) Get.toNamed(AppRoutes.profile);
        },
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 20, 24, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () => Get.back(),
                        child: Container(
                          width: 44,
                          height: 44,
                          decoration: BoxDecoration(
                            color: AppColors.surface,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Icon(Icons.arrow_back_ios_new_rounded,
                              size: 18, color: AppColors.textDark),
                        ),
                      ),
                      const Gap(16),
                      const Text(
                        'Our Menu',
                        style: TextStyle(
                          fontFamily: 'PlayfairDisplay',
                          fontSize: 22,
                          fontWeight: FontWeight.w700,
                          color: AppColors.textDark,
                        ),
                      ),
                    ],
                  ),

                  const Gap(16),

                  CafforaSearchBar(onChanged: controller.search),

                  const Gap(16),

                  Obx(() => SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: controller.categories.map((cat) {
                            return Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: Obx(() => CategoryChip(
                                    label: cat.name,
                                    isSelected:
                                        controller.selectedCategory.value ==
                                            cat.name,
                                    onTap: () =>
                                        controller.filterByCategory(cat.name),
                                  )),
                            );
                          }).toList(),
                        ),
                      )),

                  const Gap(20),
                ],
              ),
            ),

            Expanded(
              child: Obx(() => controller.isLoading.value
                  ? ListView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      itemCount: 5,
                      itemBuilder: (_, __) => Padding(
                        padding: const EdgeInsets.only(bottom: 16),
                        child: ShimmerBox(
                            width: double.infinity,
                            height: 114,
                            radius: 18),
                      ),
                    )
                  : controller.products.isEmpty
                      ? const Center(
                          child: Text(
                            'No items found',
                            style: TextStyle(
                              fontFamily: 'DMSans',
                              fontSize: 15,
                              color: AppColors.textLight,
                            ),
                          ),
                        )
                      : ListView.builder(
                          padding: const EdgeInsets.symmetric(horizontal: 24),
                          itemCount: controller.products.length,
                          itemBuilder: (context, i) => ProductCardWidget(
                            product: controller.products[i],
                          ).animate().fadeIn(
                              delay: Duration(milliseconds: i * 60),
                              duration: 400.ms),
                        )),
            ),
          ],
        ),
      ),
    );
  }
}