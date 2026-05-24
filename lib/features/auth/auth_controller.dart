import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:coffee_shpo/app/routes.dart';
import 'package:coffee_shpo/core/constatnts/app_strings.dart';
import 'package:coffee_shpo/core/extensions/string_extensions.dart';

class AuthController extends GetxController {
  final RxString name = ''.obs;
  final RxString email = ''.obs;
  final RxString password = ''.obs;
  final RxString phone = ''.obs;

  final RxBool isLoading = false.obs;
  final RxBool obscurePassword = true.obs;
  final RxString errorMessage = ''.obs;

  String verificationId = '';

  void togglePasswordVisibility() {
    obscurePassword.value = !obscurePassword.value;
  }

  Future<void> register() async {
    errorMessage.value = '';

    if (name.value.isEmpty ||
        email.value.isEmpty ||
        password.value.isEmpty ||
        phone.value.isEmpty) {
      errorMessage.value = AppStrings.fillAllFields;
      return;
    }

    if (!email.value.isValidEmail) {
      errorMessage.value = 'Please enter a valid email';
      return;
    }

    if (!password.value.isValidPassword) {
      errorMessage.value = 'Password must be at least 6 characters';
      return;
    }

    isLoading.value = true;

    try {
      await sendOtp(phone.value.trim());
    } catch (e) {
      errorMessage.value = e.toString();
    }

    isLoading.value = false;
  }

  Future<void> login() async {
    errorMessage.value = '';

    if (email.value.isEmpty || password.value.isEmpty) {
      errorMessage.value = AppStrings.fillAllFields;
      return;
    }

    isLoading.value = true;

    try {
      // TODO: Your login API logic
      Get.offAllNamed(AppRoutes.home);
    } catch (e) {
      errorMessage.value = e.toString();
    }

    isLoading.value = false;
  }

  Future<void> sendOtp(String phoneNumber) async {
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: (PhoneAuthCredential credential) async {
        await FirebaseAuth.instance.signInWithCredential(credential);
        Get.offAllNamed(AppRoutes.home);
      },
      verificationFailed: (FirebaseAuthException e) {
        Get.snackbar(
          'OTP Failed',
          e.message ?? 'Could not send OTP',
        );
      },
      codeSent: (String id, int? resendToken) {
        verificationId = id;

        Get.toNamed(
          AppRoutes.otp,
          arguments: {'phone': phoneNumber},
        );
      },
      codeAutoRetrievalTimeout: (String id) {
        verificationId = id;
      },
    );
  }

  Future<void> verifyOtp(String otp) async {
    isLoading.value = true;

    try {
      final credential = PhoneAuthProvider.credential(
        verificationId: verificationId,
        smsCode: otp,
      );

      await FirebaseAuth.instance.signInWithCredential(
        credential,
      );

      Get.offAllNamed(AppRoutes.home);
    } catch (e) {
      Get.snackbar(
        'Error',
        'Invalid OTP',
      );
    }

    isLoading.value = false;
  }
}