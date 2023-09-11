abstract class Routes {
  Routes._();

  static const HOME = _Paths.HOME;
  static const PRODUCTS = _Paths.PRODUCTS;
  static const PRODUCTDETAILS = _Paths.PRODUCTDETAILS;
  static const SIGNATURE = _Paths.SIGNATURE;
  static const SIGNIN = _Paths.SIGNIN;
  static const BIOMETRICS = _Paths.BIOMETRICS;
}

abstract class _Paths {
  static const HOME = '/';
  static const PRODUCTS = '/products';
  static const PRODUCTDETAILS = '/product_details';
  static const BIOMETRICS = '/biometrics';
  static const SIGNATURE = '/signature';
  static const SIGNIN = '/signIn';
}
