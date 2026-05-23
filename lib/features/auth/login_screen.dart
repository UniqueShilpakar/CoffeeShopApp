import 'package:coffee_shpo/app/routes.dart';
import 'package:coffee_shpo/core/constatnts/app_colors.dart';
import 'package:coffee_shpo/core/constatnts/app_strings.dart';
import 'package:coffee_shpo/shared/widgets/caffora_button.dart';
import 'package:coffee_shpo/shared/widgets/caffora_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'auth_controller.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AuthController());

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 28),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Gap(20),

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
              ).animate().fadeIn(duration: 400.ms),

              const Gap(32),

              const Text(
                AppStrings.welcomeBack,
                style: TextStyle(
                  fontFamily: 'PlayfairDisplay',
                  fontSize: 28,
                  fontWeight: FontWeight.w700,
                  color: AppColors.textDark,
                  height: 1.3,
                ),
              )
                  .animate()
                  .fadeIn(delay: 100.ms, duration: 500.ms)
                  .slideY(begin: 0.2, end: 0),

              const Gap(8),

              const Text(
                AppStrings.loginSubtitle,
                style: TextStyle(
                  fontFamily: 'DMSans',
                  fontSize: 16,
                  color: AppColors.textMedium,
                  height: 1.6,
                ),
              ).animate().fadeIn(delay: 200.ms, duration: 500.ms),

              const Gap(40),

              CafforaInput(
                label: AppStrings.emailAddress,
                hint: 'hello@example.com',
                keyboardType: TextInputType.emailAddress,
                onChanged: (v) => controller.email.value = v,
              ).animate().fadeIn(delay: 300.ms, duration: 500.ms),

              const Gap(16),

              Obx(() => CafforaInput(
                    label: AppStrings.password,
                    hint: '••••••••',
                    obscureText: controller.obscurePassword.value,
                    onChanged: (v) => controller.password.value = v,
                    suffix: GestureDetector(
                      onTap: controller.tooglePasswordVisibility,
                      child: Icon(
                        controller.obscurePassword.value
                            ? Icons.visibility_off_outlined
                            : Icons.visibility_outlined,
                        color: AppColors.textLight,
                        size: 20,
                      ),
                    ),
                  )).animate().fadeIn(delay: 400.ms, duration: 500.ms),

              const Gap(12),

              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  AppStrings.forgotPass,
                  style: const TextStyle(
                    fontFamily: 'DMSans',
                    fontSize: 14,
                    color: AppColors.primary,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ).animate().fadeIn(delay: 450.ms, duration: 500.ms),

              const Gap(12),

              Obx(() => controller.errorMessage.value.isNotEmpty
                  ? Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: Text(
                        controller.errorMessage.value,
                        style: const TextStyle(
                          fontFamily: 'DMSans',
                          fontSize: 14,
                          color: AppColors.error,
                        ),
                      ),
                    )
                  : const SizedBox.shrink()),

              Obx(() => CafforaButton(
                    label: AppStrings.signInBtn,
                    isLoading: controller.isLoading.value,
                    onPressed: controller.login,
                  )).animate().fadeIn(delay: 500.ms, duration: 500.ms),

              const Gap(32),

              Row(children: [
                const Expanded(child: Divider(color: AppColors.divider)),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    AppStrings.orContinue,
                    style: const TextStyle(
                      fontFamily: 'DMSans',
                      fontSize: 12,
                      color: AppColors.textLight,
                    ),
                  ),
                ),
                const Expanded(child: Divider(color: AppColors.divider)),
              ]).animate().fadeIn(delay: 550.ms, duration: 500.ms),

              const Gap(24),

              GestureDetector(
                onTap: () => Get.toNamed(AppRoutes.otp),
                child: Container(
                  width: double.infinity,
                  height: 56,
                  decoration: BoxDecoration(
                    color: AppColors.surface,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: AppColors.divider),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.phone_outlined,
                          color: AppColors.primary, size: 20),
                      Gap(10),
                      Text(
                        AppStrings.phoneOtp,
                        style: TextStyle(
                          fontFamily: 'DMSans',
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: AppColors.textDark,
                        ),
                      ),
                    ],
                  ),
                ),
              ).animate().fadeIn(delay: 600.ms, duration: 500.ms),

              const Gap(40),

              Center(
                child: GestureDetector(
                  onTap: () => Get.toNamed(AppRoutes.register),
                  child: RichText(
                    text: const TextSpan(
                      text: '${AppStrings.noAccount}  ',
                      style: TextStyle(
                        fontFamily: 'DMSans',
                        fontSize: 14,
                        color: AppColors.textMedium,
                      ),
                      children: [
                        TextSpan(
                          text: AppStrings.signUp,
                          style: TextStyle(
                            color: AppColors.primary,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ).animate().fadeIn(delay: 650.ms, duration: 500.ms),

              const Gap(32),
            ],
          ),
        ),
      ),
    );
  }
}