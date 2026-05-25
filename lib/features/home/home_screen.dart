import 'package:coffee_shpo/core/constatnts/app_colors.dart';
import 'package:coffee_shpo/shared/widgets/loading_shimer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import '../../app/routes.dart';
import '../../data/models/product_model.dart';
import '../../shared/widgets/bottom_nav_bar.dart';
import '../../shared/widgets/category_chip.dart';
import '../../shared/widgets/search_bar.dart';
import '../../shared/widgets/star_rating.dart';
import 'home_controller.dart';
import 'widgets/offer_banner_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());

    return Scaffold(
      backgroundColor: AppColors.background,
      bottomNavigationBar: CafforaBottomNavBar( // ← NO Obx here
        currentIndex: 0,
        onTap: (i) {
          if (i == 1) Get.toNamed(AppRoutes.menu);
          if (i == 2) Get.toNamed(AppRoutes.cart);
          if (i == 3) Get.toNamed(AppRoutes.profile);
        },
      ),
      body: SafeArea(
        child: RefreshIndicator(
          color: AppColors.primary,
          onRefresh: controller.loadData,
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Gap(20),

                // Header
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Good morning ☀️',
                          style: TextStyle(
                            fontFamily: 'DMSans',
                            fontSize: 13,
                            color: AppColors.textLight,
                          ),
                        ),
                        Gap(2),
                        Text(
                          'What would you like?',
                          style: TextStyle(
                            fontFamily: 'PlayfairDisplay',
                            fontSize: 22,
                            fontWeight: FontWeight.w700,
                            color: AppColors.textDark,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      width: 44,
                      height: 44,
                      decoration: BoxDecoration(
                        color: AppColors.surface,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Icon(Icons.notifications_outlined,
                          color: AppColors.textDark, size: 22),
                    ),
                  ],
                ).animate().fadeIn(duration: 500.ms),

                const Gap(20),

                // Search bar
                CafforaSearchBar(
                  readOnly: true,
                  onTap: () => Get.toNamed(AppRoutes.menu),
                ).animate().fadeIn(delay: 100.ms, duration: 500.ms),

                const Gap(24),

                // Banners
                Obx(() => controller.isLoading.value
                    ? const ShimmerBox(
                        width: double.infinity, height: 130, radius: 20)
                    : OfferBannerWidget(banners: controller.banners),
                ).animate().fadeIn(delay: 200.ms, duration: 500.ms),

                const Gap(28),

                // Categories title
                const Text(
                  'Categories',
                  style: TextStyle(
                    fontFamily: 'PlayfairDisplay',
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: AppColors.textDark,
                  ),
                ).animate().fadeIn(delay: 300.ms, duration: 500.ms),

                const Gap(14),

                // Categories chips
                Obx(() => controller.isLoading.value
                    ? Row(
                        children: List.generate(
                          4,
                          (i) => Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: ShimmerBox(width: 80, height: 38, radius: 12),
                          ),
                        ),
                      )
                    : SingleChildScrollView(
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
                                        controller.selectCategory(cat.name),
                                  )),
                            );
                          }).toList(),
                        ),
                      ),
                ).animate().fadeIn(delay: 350.ms, duration: 500.ms),

                const Gap(28),

                // Popular heading
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Popular Right Now',
                      style: TextStyle(
                        fontFamily: 'PlayfairDisplay',
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: AppColors.textDark,
                      ),
                    ),
                    GestureDetector(
                      onTap: () => Get.toNamed(AppRoutes.menu),
                      child: const Text(
                        'See all',
                        style: TextStyle(
                          fontFamily: 'DMSans',
                          fontSize: 13,
                          color: AppColors.primary,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ).animate().fadeIn(delay: 400.ms, duration: 500.ms),

                const Gap(16),

                // Product cards
                Obx(() => controller.isLoading.value
                    ? SizedBox(
                        height: 220,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 3,
                          itemBuilder: (_, __) => const ProductCardShimmer(),
                        ),
                      )
                    : SizedBox(
                        height: 220,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: controller.popularProducts.length,
                          itemBuilder: (context, i) => _ProductCard(
                            product: controller.popularProducts[i],
                          ),
                        ),
                      ),
                ).animate().fadeIn(delay: 450.ms, duration: 500.ms),

                const Gap(32),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _ProductCard extends StatelessWidget {
  final ProductModel product;
  const _ProductCard({required this.product});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.toNamed(AppRoutes.productDetail, arguments: product),
      child: Container(
        width: 160,
        margin: const EdgeInsets.only(right: 16),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 16,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 120,
              decoration: const BoxDecoration(
                color: AppColors.surface,
                borderRadius:
                    BorderRadius.vertical(top: Radius.circular(20)),
              ),
              child: Center(
                child: Icon(Icons.coffee_rounded,
                    size: 48,
                    color: AppColors.primary.withOpacity(0.3)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name,
                    style: const TextStyle(
                      fontFamily: 'DMSans',
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: AppColors.textDark,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const Gap(4),
                  StarRating(
                      rating: product.rating,
                      reviewCount: product.reviewCount),
                  const Gap(8),
                  Text(
                    'Rs. ${product.price.toInt()}',
                    style: const TextStyle(
                      fontFamily: 'DMSans',
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: AppColors.primary,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}