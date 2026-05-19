import 'package:get/get.dart';
import '../features/splash/splash_screen.dart';



class AppRoutes {
  static const String splash   = '/';
  static const String landing  = '/landing';
  static const String login    = '/login';
  static const String register = '/register';
  static const String otp      = '/otp';

  static final List<GetPage> pages = [
    GetPage(name: splash,   page: () => const SplashScreen()),
    // GetPage(name: landing,  page: () => const LandingScreen()),
    // GetPage(name: login,    page: () => const LoginScreen()),
    // GetPage(name: register, page: () => const RegisterScreen()),
    // GetPage(name: otp,      page: () => const OtpScreen()),
  ];
}