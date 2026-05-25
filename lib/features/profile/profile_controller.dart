import 'package:get/get.dart';
import '../../data/models/user_model.dart';
import '../../app/routes.dart';

class ProfileController extends GetxController {
  final Rx<UserModel?> user = Rx<UserModel?>(
    const UserModel(
      id: 'USR-001',
      name: 'Unique Shilpakar',
      email: 'UniqueShilpakar17@gmail.com',
      phone: '+977 9761626772',
    ),
  );

  void logout() {
    user.value = null;
    Get.offAllNamed(AppRoutes.landing);
  }
}