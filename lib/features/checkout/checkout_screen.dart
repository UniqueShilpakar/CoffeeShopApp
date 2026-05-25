import 'package:coffee_shpo/app/routes.dart';
import 'package:coffee_shpo/core/constatnts/app_colors.dart';
import 'package:coffee_shpo/features/cart/cart_controller.dart';
import 'package:coffee_shpo/shared/widgets/caffora_button.dart';
import 'package:coffee_shpo/shared/widgets/caffora_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';


class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cartController  = Get.find<CartController>();
    final RxString address = ''.obs;
    final RxInt payMethod  = 0.obs;
    final RxBool isLoading = false.obs;

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Gap(20),
              Row(
                children: [
                  GestureDetector(
                    onTap: () => Get.back(),
                    child: Container(
                      width: 44, height: 44,
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
                    'Checkout',
                    style: TextStyle(
                      fontFamily: 'PlayfairDisplay',
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                      color: AppColors.textDark,
                    ),
                  ),
                ],
              ).animate().fadeIn(duration: 400.ms),

              const Gap(28),

              const Text('Delivery Address',
                  style: TextStyle(
                    fontFamily: 'DMSans',
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textDark,
                  )).animate().fadeIn(delay: 100.ms),

              const Gap(12),

              CafforaInput(
                label: 'Address',
                hint: 'Enter your delivery address',
                onChanged: (v) => address.value = v,
              ).animate().fadeIn(delay: 150.ms),

              const Gap(24),

              const Text('Payment Method',
                  style: TextStyle(
                    fontFamily: 'DMSans',
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textDark,
                  )).animate().fadeIn(delay: 200.ms),

              const Gap(12),

              Obx(() => Column(
                children: [
                  _PayOption(
                    icon: Icons.money_rounded,
                    label: 'Cash on Delivery',
                    index: 0,
                    selected: payMethod.value,
                    onTap: () => payMethod.value = 0,
                  ),
                  const Gap(10),
                  _PayOption(
                    icon: Icons.account_balance_wallet_rounded,
                    label: 'eSewa / Khalti',
                    index: 1,
                    selected: payMethod.value,
                    onTap: () => payMethod.value = 1,
                  ),
                ],
              )).animate().fadeIn(delay: 250.ms),

              const Gap(28),

              const Text('Order Summary',
                  style: TextStyle(
                    fontFamily: 'DMSans',
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textDark,
                  )).animate().fadeIn(delay: 300.ms),

              const Gap(12),

              Obx(() => Column(
                children: [
                  ...cartController.items.map((item) => Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('${item.product.name} x${item.quantity}',
                            style: const TextStyle(
                              fontFamily: 'DMSans',
                              fontSize: 14,
                              color: AppColors.textMedium,
                            )),
                        Text('Rs. ${item.totalPrice.toInt()}',
                            style: const TextStyle(
                              fontFamily: 'DMSans',
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: AppColors.textDark,
                            )),
                      ],
                    ),
                  )),
                  const Divider(color: AppColors.divider),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Total',
                          style: TextStyle(
                            fontFamily: 'DMSans',
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: AppColors.textDark,
                          )),
                      Text('Rs. ${cartController.total.toInt()}',
                          style: const TextStyle(
                            fontFamily: 'PlayfairDisplay',
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            color: AppColors.primary,
                          )),
                    ],
                  ),
                ],
              )).animate().fadeIn(delay: 350.ms),

              const Gap(32),

              Obx(() => CafforaButton(
                label: 'Place Order',
                isLoading: isLoading.value,
                onPressed: () async {
                  isLoading.value = true;
                  await Future.delayed(const Duration(seconds: 1));
                  cartController.clear();
                  isLoading.value = false;
                  Get.offNamed(AppRoutes.orderConfirmation);
                },
              )).animate().fadeIn(delay: 400.ms),

              const Gap(32),
            ],
          ),
        ),
      ),
    );
  }
}

class _PayOption extends StatelessWidget {
  final IconData icon;
  final String label;
  final int index;
  final int selected;
  final VoidCallback onTap;

  const _PayOption({
    required this.icon, required this.label,
    required this.index, required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final bool isSelected = index == selected;
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        decoration: BoxDecoration(
          color: isSelected
              ? AppColors.primary.withOpacity(0.07)
              : AppColors.surface,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color: isSelected ? AppColors.primary : AppColors.divider,
            width: isSelected ? 1.5 : 1,
          ),
        ),
        child: Row(
          children: [
            Icon(icon,
                color: isSelected ? AppColors.primary : AppColors.textLight,
                size: 22),
            const Gap(12),
            Text(label,
                style: TextStyle(
                  fontFamily: 'DMSans',
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: isSelected ? AppColors.primary : AppColors.textMedium,
                )),
            const Spacer(),
            if (isSelected)
              const Icon(Icons.check_circle_rounded,
                  color: AppColors.primary, size: 20),
          ],
        ),
      ),
    );
  }
}