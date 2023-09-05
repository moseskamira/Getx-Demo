import 'package:get/get.dart';
import 'package:get_x_app/utils/toast_message.dart';
import 'package:local_auth/local_auth.dart';
import 'package:local_auth_android/local_auth_android.dart';
import 'package:local_auth_ios/local_auth_ios.dart';

class BiometricsController extends GetxController {
  final _localAuth = LocalAuthentication();
  var isUserAuthenticated = false.obs;

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
        isUserAuthenticated.value = await _localAuth.authenticate(
            localizedReason: 'Verify Your Identity',
            authMessages: authMessages);
        if (isUserAuthenticated.value) {
          showSnackBar('Authenticated Successfully', error: false);
        } else {
          showSnackBar('Failed Authentication', error: true);
        }
      } else {
        showSnackBar('Feature not supported', error: true);
      }
    } catch (e) {
      showSnackBar(e.toString(), error: true);
    }
  }
}
