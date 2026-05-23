import 'package:coffee_shpo/app/routes.dart';
import 'package:coffee_shpo/core/constatnts/app_colors.dart';
import 'package:coffee_shpo/core/constatnts/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 28),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Gap(20),

              Container(
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                decoration: BoxDecoration(
                  color: AppColors.surface,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Text(
                  AppStrings.craftedWith,
                  style: TextStyle(
                    fontFamily: 'DMSans',
                    fontSize: 12,
                    color: AppColors.primary,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ).animate().fadeIn(duration: 500.ms),

              const Gap(24),

              Container(
                width: double.infinity,
                height: size.height * 0.38,
                decoration: BoxDecoration(
                  color: AppColors.surface,
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    // swap with: Image.asset(AppAssets.splashLogo, fit: BoxFit.cover)
                    Icon(
                      Icons.coffee_rounded,
                      size: 100,
                      color: AppColors.primary.withOpacity(0.15),
                    ),
                    Positioned(
                      bottom: 20,
                      right: 20,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 14, vertical: 8),
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.06),
                              blurRadius: 12,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: const Row(
                          children: [
                            Icon(Icons.star_rounded,
                                color: Color(0xFFFFC107), size: 16),
                            Gap(4),
                            Text(
                              AppStrings.topRated,
                              style: TextStyle(
                                fontFamily: 'DMSans',
                                fontSize: 12,
                                color: AppColors.textDark,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )
                  .animate()
                  .fadeIn(delay: 200.ms, duration: 600.ms)
                  .slideY(begin: 0.1, end: 0),

              const Gap(36),

              const Text(
                AppStrings.heroTitle,
                style: TextStyle(
                  fontFamily: 'PlayfairDisplay',
                  fontSize: 36,
                  fontWeight: FontWeight.w700,
                  color: AppColors.textDark,
                  height: 1.2,
                ),
              )
                  .animate()
                  .fadeIn(delay: 400.ms, duration: 600.ms)
                  .slideY(begin: 0.2, end: 0),

              const Gap(14),

              const Text(
                AppStrings.heroSubtitle,
                style: TextStyle(
                  fontFamily: 'DMSans',
                  fontSize: 16,
                  color: AppColors.textMedium,
                  height: 1.6,
                ),
              ).animate().fadeIn(delay: 550.ms, duration: 600.ms),

              const Spacer(),

              SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  onPressed: () => Get.toNamed(AppRoutes.register),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    foregroundColor: AppColors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  child: const Text(
                    AppStrings.getStarted,
                    style: TextStyle(
                      fontFamily: 'DMSans',
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: AppColors.white,
                    ),
                  ),
                ),
              )
                  .animate()
                  .fadeIn(delay: 700.ms, duration: 500.ms)
                  .slideY(begin: 0.3, end: 0),

              const Gap(16),

              Center(
                child: GestureDetector(
                  onTap: () => Get.toNamed(AppRoutes.login),
                  child: RichText(
                    text: const TextSpan(
                      text: '${AppStrings.alreadyHave}  ',
                      style: TextStyle(
                        fontFamily: 'DMSans',
                        fontSize: 14,
                        color: AppColors.textMedium,
                      ),
                      children: [
                        TextSpan(
                          text: AppStrings.signIn,
                          style: TextStyle(
                            color: AppColors.primary,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ).animate().fadeIn(delay: 800.ms, duration: 500.ms),

              const Gap(32),
            ],
          ),
        ),
      ),
    );
  }
}