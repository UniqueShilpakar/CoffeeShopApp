import 'package:coffee_shpo/features/auth/login_screen.dart';
import 'package:coffee_shpo/features/auth/otp_screen.dart';
import 'package:coffee_shpo/features/auth/register_screen.dart';
import 'package:coffee_shpo/features/landing/landing_screen.dart';
import 'package:get/get.dart';
import '../features/splash/splash_screen.dart';



class AppRoutes {
  static const String splash   = '/';
  static const String landing  = '/landing';
  static const String login    = '/login';
  static const String register = '/register';
  static const String otp      = '/otp';
  // next session
  static const String home     = '/home';
  static const String menu     = '/menu';
  static const String cart     = '/cart';
  static const String profile  = '/profile';

  static final List<GetPage> pages = [
    GetPage(name: splash,   page: () => const SplashScreen()),
    GetPage(name: landing,  page: () => const LandingScreen()),
    GetPage(name: login,    page: () => const LoginScreen()),
    GetPage(name: register, page: () => const RegisterScreen()),
    GetPage(name: otp,      page: () => const OtpScreen()),
  ];
}