import 'package:coffee_shpo/app/routes.dart';
import 'package:coffee_shpo/core/constatnts/app_colors.dart';
import 'package:coffee_shpo/shared/widgets/bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'profile_controller.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProfileController());

    return Scaffold(
      backgroundColor: AppColors.background,
      bottomNavigationBar: CafforaBottomNavBar(
        currentIndex: 3,
        onTap: (i) {
          if (i == 0) Get.offNamed(AppRoutes.home);
          if (i == 1) Get.toNamed(AppRoutes.menu);
          if (i == 2) Get.toNamed(AppRoutes.cart);
        },
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              const Gap(20),

              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'My Profile',
                  style: TextStyle(
                    fontFamily: 'PlayfairDisplay',
                    fontSize: 26,
                    fontWeight: FontWeight.w700,
                    color: AppColors.textDark,
                  ),
                ),
              ).animate().fadeIn(duration: 400.ms),

              const Gap(28),

              // Avatar + name
              Obx(() => Column(
                children: [
                  Container(
                    width: 90, height: 90,
                    decoration: BoxDecoration(
                      color: AppColors.surface,
                      shape: BoxShape.circle,
                      border: Border.all(
                          color: AppColors.primary.withOpacity(0.3),
                          width: 2),
                    ),
                    child: const Icon(Icons.person_rounded,
                        size: 44, color: AppColors.primary),
                  ),
                  const Gap(14),
                  Text(
                    controller.user.value?.name ?? 'Guest',
                    style: const TextStyle(
                      fontFamily: 'PlayfairDisplay',
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: AppColors.textDark,
                    ),
                  ),
                  const Gap(4),
                  Text(
                    controller.user.value?.email ?? '',
                    style: const TextStyle(
                      fontFamily: 'DMSans',
                      fontSize: 14,
                      color: AppColors.textLight,
                    ),
                  ),
                ],
              )).animate().fadeIn(delay: 100.ms, duration: 400.ms),

              const Gap(32),

              // Menu items
              _ProfileTile(
                icon: Icons.shopping_bag_outlined,
                label: 'Order History',
                onTap: () => Get.toNamed(AppRoutes.orderHistory),
              ).animate().fadeIn(delay: 200.ms),

              _ProfileTile(
                icon: Icons.location_on_outlined,
                label: 'Saved Addresses',
                onTap: () {},
              ).animate().fadeIn(delay: 260.ms),

              _ProfileTile(
                icon: Icons.payment_outlined,
                label: 'Payment Methods',
                onTap: () {},
              ).animate().fadeIn(delay: 320.ms),

              _ProfileTile(
                icon: Icons.notifications_outlined,
                label: 'Notifications',
                onTap: () {},
              ).animate().fadeIn(delay: 380.ms),

              _ProfileTile(
                icon: Icons.help_outline_rounded,
                label: 'Help & Support',
                onTap: () {},
              ).animate().fadeIn(delay: 440.ms),

              const Gap(8),

              _ProfileTile(
                icon: Icons.logout_rounded,
                label: 'Logout',
                onTap: controller.logout,
                isDestructive: true,
              ).animate().fadeIn(delay: 500.ms),

              const Gap(32),
            ],
          ),
        ),
      ),
    );
  }
}

class _ProfileTile extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;
  final bool isDestructive;

  const _ProfileTile({
    required this.icon,
    required this.label,
    required this.onTap,
    this.isDestructive = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(14),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.04),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            Icon(icon,
                color: isDestructive ? AppColors.error : AppColors.primary,
                size: 22),
            const Gap(14),
            Expanded(
              child: Text(
                label,
                style: TextStyle(
                  fontFamily: 'DMSans',
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: isDestructive
                      ? AppColors.error
                      : AppColors.textDark,
                ),
              ),
            ),
            if (!isDestructive)
              const Icon(Icons.arrow_forward_ios_rounded,
                  size: 14, color: AppColors.textLight),
          ],
        ),
      ),
    );
  }
}