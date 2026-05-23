import 'package:coffee_shpo/core/constatnts/app_colors.dart';
import 'package:coffee_shpo/core/constatnts/app_strings.dart';
import 'package:coffee_shpo/shared/widgets/caffora_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'auth_controller.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final List<TextEditingController> _controllers =
      List.generate(4, (_) => TextEditingController());
  final List<FocusNode> _focusNodes =
      List.generate(4, (_) => FocusNode());

  String get _otp => _controllers.map((c) => c.text).join();

  @override
  void dispose() {
    for (final c in _controllers) c.dispose();
    for (final f in _focusNodes) f.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AuthController());
    final phone = (Get.arguments as Map?)?['phone'] ?? '';

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
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

              const Gap(40),

              Container(
                width: 64,
                height: 64,
                decoration: BoxDecoration(
                  color: AppColors.surface,
                  borderRadius: BorderRadius.circular(18),
                ),
                child: const Icon(Icons.lock_outline_rounded,
                    color: AppColors.primary, size: 30),
              ).animate().scale(
                  delay: 100.ms,
                  duration: 500.ms,
                  curve: Curves.easeOutBack),

              const Gap(24),

              const Text(
                AppStrings.verifyTitle,
                style: TextStyle(
                  fontFamily: 'PlayfairDisplay',
                  fontSize: 28,
                  fontWeight: FontWeight.w700,
                  color: AppColors.textDark,
                  height: 1.3,
                ),
              )
                  .animate()
                  .fadeIn(delay: 200.ms, duration: 500.ms)
                  .slideY(begin: 0.2, end: 0),

              const Gap(10),

              Text(
                phone.isNotEmpty
                    ? '${AppStrings.verifySub}$phone'
                    : AppStrings.verifySub2,
                style: const TextStyle(
                  fontFamily: 'DMSans',
                  fontSize: 16,
                  color: AppColors.textMedium,
                  height: 1.6,
                ),
              ).animate().fadeIn(delay: 300.ms, duration: 500.ms),

              const Gap(48),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(
                  4,
                  (i) => _OtpBox(
                    controller: _controllers[i],
                    focusNode: _focusNodes[i],
                    onChanged: (v) {
                      if (v.isNotEmpty && i < 3) {
                        _focusNodes[i + 1].requestFocus();
                      } else if (v.isEmpty && i > 0) {
                        _focusNodes[i - 1].requestFocus();
                      }
                      setState(() {});
                    },
                  ),
                ),
              ).animate().fadeIn(delay: 400.ms, duration: 500.ms),

              const Gap(24),

              Center(
                child: RichText(
                  text: const TextSpan(
                    text: '${AppStrings.didntReceive}  ',
                    style: TextStyle(
                      fontFamily: 'DMSans',
                      fontSize: 14,
                      color: AppColors.textMedium,
                    ),
                    children: [
                      TextSpan(
                        text: AppStrings.resendOtp,
                        style: TextStyle(
                          color: AppColors.primary,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ).animate().fadeIn(delay: 500.ms, duration: 500.ms),

              const Spacer(),

              Obx(() => CafforaButton(
                    label: AppStrings.verifyBtn,
                    isLoading: controller.isLoading.value,
                    onPressed: _otp.length == 4
                        ? () => controller.verifyOtp(_otp)
                        : null,
                  )).animate().fadeIn(delay: 600.ms, duration: 500.ms),

              const Gap(32),
            ],
          ),
        ),
      ),
    );
  }
}

class _OtpBox extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode focusNode;
  final ValueChanged<String> onChanged;

  const _OtpBox({
    required this.controller,
    required this.focusNode,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 68,
      height: 68,
      child: TextField(
        controller: controller,
        focusNode: focusNode,
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        maxLength: 1,
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        onChanged: onChanged,
        style: const TextStyle(
          fontFamily: 'PlayfairDisplay',
          fontSize: 24,
          fontWeight: FontWeight.w700,
          color: AppColors.textDark,
        ),
        decoration: InputDecoration(
          counterText: '',
          filled: true,
          fillColor: AppColors.inputFill,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide:
                const BorderSide(color: AppColors.primary, width: 2),
          ),
        ),
      ),
    );
  }
}