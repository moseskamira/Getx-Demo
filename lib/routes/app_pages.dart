import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';

import '../binding/product_controller_binding.dart';
import '../main.dart';
import '../pages/biometric_page.dart';
import '../pages/product_details_page.dart';
import '../pages/products_page.dart';
import '../pages/sign_in_page.dart';
import '../pages/signature_page.dart';
import 'app_routes.dart';

abstract class AppPages{
  AppPages._();
  static const INITIAL = Routes.HOME;
  static final routes = [
    GetPage(name: Routes.HOME, page: () => const MyApp()),
    GetPage(
      name: Routes.PRODUCTS,
      page: () => const ProductsPage(),
      transition: Transition.leftToRight,
      binding: ProductControllerBinding(),
    ),
    GetPage(
      name: Routes.PRODUCTDETAILS,
      page: () => const ProductDetailsPage(),
      transition: Transition.leftToRight,
    ),
    GetPage(
      name: Routes.BIOMETRICS,
      page: () => const BiometricPage(),
      transition: Transition.leftToRight,
    ),
    GetPage(
      name: Routes.SIGNATURE,
      page: () => const SignaturePage(),
      transition: Transition.leftToRight,
    ),
    GetPage(
      name: Routes.SIGNIN,
      page: () => const SignInPage(),
      transition: Transition.leftToRight,
    ),
  ];



}
