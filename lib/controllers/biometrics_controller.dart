import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_x_app/utils/toast_message.dart';
import 'package:local_auth/local_auth.dart';
import 'package:local_auth_android/local_auth_android.dart';
import 'package:local_auth_ios/local_auth_ios.dart';

class BiometricsController extends GetxController {
  final _localAuth = LocalAuthentication();

  void authenticateUser() async {
    try {
      const authMessages = <AuthMessages>[
        AndroidAuthMessages(
          signInTitle: 'Biometric Authentication Required!',
          cancelButton: 'Cancel',
          goToSettingsButton: 'Settings',
          goToSettingsDescription: 'Please setup your Fingerprint/Face',
        ),
        IOSAuthMessages(
          cancelButton: 'Cancel',
          goToSettingsButton: 'Settings',
          goToSettingsDescription: 'Please setup your Fingerprint/Face',
        ),
      ];
      bool isBiometricSupported = await _localAuth.isDeviceSupported();
      bool canCheckBiometrics = await _localAuth.canCheckBiometrics;
      if (isBiometricSupported && canCheckBiometrics) {
        List<BiometricType> availableBiometrics =
            await _localAuth.getAvailableBiometrics();
        bool isUserAuthenticated = await _localAuth.authenticate(
          localizedReason: 'Please verify your identity to grant access',
          authMessages: authMessages,
          options: const AuthenticationOptions(
            useErrorDialogs: true,
            stickyAuth: true,
          ),
        );
        if (isUserAuthenticated) {
          showSnackBar('User Authenticated Successfully', error: false);
        } else {
          showSnackBar('Failed Authentication', error: true);
        }
      } else {
        showSnackBar('Feature not supported', error: true);
      }
    } on PlatformException catch (e) {
      showSnackBar(e.toString(), error: true);
    }
  }
}
