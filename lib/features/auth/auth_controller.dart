import 'package:coffee_shpo/app/routes.dart';
import 'package:coffee_shpo/core/constatnts/app_strings.dart';
import 'package:coffee_shpo/core/extensions/string_extensions.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  final RxString name = ''.obs;
  final RxString email = ''.obs;
  final RxString password = ''.obs;
  final RxString phone = ''.obs;
  final RxBool isLoading = false.obs;
  final RxBool obscurePassword = true.obs;
  final RxString errorMessage = ''.obs;

  void tooglePasswordVisibility() => !obscurePassword.value;

  Future<void> register() async {
    errorMessage.value = '';
    if (name.value.isEmpty || email.value.isEmpty || password.value.isEmpty) {
      errorMessage.value = AppStrings.fillAllFields;
      return;
    }
    if (!email.value.isValidEmail) {
      errorMessage.value = 'Please enter a valid email.';
      return;
    }
    if (!password.value.isValidPassword) {
      errorMessage.value = 'Password must be at least 6 characters.';
      return;
    }
    isLoading.value = true;
    await Future.delayed(const Duration(seconds: 1)); // replace with API call
    isLoading.value = false;
    Get.toNamed(AppRoutes.otp, arguments: {'phone': phone.value});
  }

  Future<void> login() async {
    errorMessage.value = '';
    if (email.value.isEmpty || password.value.isEmpty) {
      errorMessage.value = AppStrings.fillAllFields;
      return;
    }
    isLoading.value = true;
    await Future.delayed(const Duration(seconds: 1)); // replace with API call
    isLoading.value = false;
    // Get.offAllNamed(AppRoutes.home);
  }

  Future<void> verifyOtp(String otp) async {
    isLoading.value = true;
    await Future.delayed(const Duration(seconds: 1)); // replace with API call
    isLoading.value = false;
    // Get.offAllNamed(AppRoutes.home);
  }
}
