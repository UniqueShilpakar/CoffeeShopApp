import 'package:coffee_shpo/features/auth/login_screen.dart';
import 'package:coffee_shpo/features/auth/register_screen.dart';
import 'package:coffee_shpo/features/cart/cart_screen.dart';
import 'package:coffee_shpo/features/checkout/checkout_screen.dart';
import 'package:coffee_shpo/features/checkout/order_confirmation_screen.dart';
import 'package:coffee_shpo/features/home/home_screen.dart';
import 'package:coffee_shpo/features/landing/landing_screen.dart';
import 'package:coffee_shpo/features/menu/menu_screen.dart';
import 'package:coffee_shpo/features/order_history/order_history_screen.dart';
import 'package:coffee_shpo/features/product_detail/product_detail_screen.dart';
import 'package:coffee_shpo/features/profile/profile_screen.dart';
import 'package:coffee_shpo/features/splash/splash_screen.dart';
import 'package:get/get.dart';


class AppRoutes {
  static const String splash             = '/';
  static const String landing            = '/landing';
  static const String login              = '/login';
  static const String register           = '/register';
  static const String otp                = '/otp';
  static const String home               = '/home';
  static const String menu               = '/menu';
  static const String productDetail      = '/product-detail';
  static const String cart               = '/cart';
  static const String checkout           = '/checkout';
  static const String orderConfirmation  = '/order-confirmation';
  static const String orderHistory       = '/order-history';
  static const String profile            = '/profile';

  static final List<GetPage> pages = [
    GetPage(name: splash,            page: () => const SplashScreen()),
    GetPage(name: landing,           page: () => const LandingScreen()),
    GetPage(name: login,             page: () => const LoginScreen()),
    GetPage(name: register,          page: () => const RegisterScreen()),
    GetPage(name: home,              page: () => const HomeScreen()),
    GetPage(name: menu,              page: () => const MenuScreen()),
    GetPage(name: productDetail,     page: () => const ProductDetailScreen()),
    GetPage(name: cart,              page: () => const CartScreen()),
    GetPage(name: checkout,          page: () => const CheckoutScreen()),
    GetPage(name: orderConfirmation, page: () => const OrderConfirmationScreen()),
    GetPage(name: orderHistory,      page: () => const OrderHistoryScreen()),
    GetPage(name: profile,           page: () => const ProfileScreen()),
  ];
}