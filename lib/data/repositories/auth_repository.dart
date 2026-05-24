import 'package:coffee_shpo/data/models/user_model.dart';

class AuthRepository {
  UserModel? _currentUser;

  UserModel? get currentUser => _currentUser;

  Future<UserModel> login(String email, String password) async {
    await Future.delayed(const Duration(seconds: 1));
    _currentUser = UserModel(
      id: 'USR-001',
      name: 'Alex Johnson',
      email: email,
      phone: '+977 9800000000',
    );
    return _currentUser!;
  }

  Future<UserModel> register({
    required String name,
    required String email,
    required String password,
    required String phone,
  }) async {
    await Future.delayed(const Duration(seconds: 1));
    _currentUser = UserModel(
      id: 'USR-${DateTime.now().millisecondsSinceEpoch}',
      name: name,
      email: email,
      phone: phone,
    );
    return _currentUser!;
  }

  Future<bool> verifyOtp(String otp) async {
    await Future.delayed(const Duration(seconds: 1));
    return otp == '1234'; // mock
  }

  void logout() => _currentUser = null;
}