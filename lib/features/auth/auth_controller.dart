import 'package:coffee_shpo/app/routes.dart';
import 'package:coffee_shpo/core/constatnts/app_strings.dart';
import 'package:get/get.dart';


class AuthController extends GetxController {
  final RxString name          = ''.obs;
  final RxString email         = ''.obs;
  final RxString password      = ''.obs;
  final RxString phone         = ''.obs;
  final RxBool isLoading       = false.obs;
  final RxBool obscurePassword = true.obs;
  final RxString errorMessage  = ''.obs;

  void togglePasswordVisibility() =>
      obscurePassword.value = !obscurePassword.value;

  Future<void> register() async {
    errorMessage.value = '';
    if (name.value.isEmpty || email.value.isEmpty || password.value.isEmpty) {
      errorMessage.value = AppStrings.fillAllFields;
      return;
    }
    isLoading.value = true;
    await Future.delayed(const Duration(seconds: 1));
    isLoading.value = false;
    Get.offAllNamed(AppRoutes.home); // ← go straight to home
  }

  Future<void> login() async {
    errorMessage.value = '';
    if (email.value.isEmpty || password.value.isEmpty) {
      errorMessage.value = AppStrings.fillAllFields;
      return;
    }
    isLoading.value = true;
    await Future.delayed(const Duration(seconds: 1));
    isLoading.value = false;
    Get.offAllNamed(AppRoutes.home); // ← go straight to home
  }
}