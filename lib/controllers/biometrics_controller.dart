import 'package:get/get.dart';
import 'package:get_x_app/utils/toast_message.dart';
import 'package:local_auth/local_auth.dart';
import 'package:local_auth_android/local_auth_android.dart';
import 'package:local_auth_ios/local_auth_ios.dart';

class BiometricsController extends GetxController {
  final _localAuth = LocalAuthentication();
  var hasFingerPrintLock = false.obs;
  var hasFaceLock = false.obs;
  var isUserAuthenticated = false.obs;

  void getAvailableBiometrics() async {
    bool hasLocalAuthentication = await _localAuth.canCheckBiometrics;
    if (hasLocalAuthentication) {
      List<BiometricType> availableBiometrics =
          await _localAuth.getAvailableBiometrics();
      hasFaceLock.value = availableBiometrics.contains(BiometricType.face);
      hasFingerPrintLock.value =
          availableBiometrics.contains(BiometricType.fingerprint);
    } else {
      showSnackBar('Local Authentication Not Supported', error: true);
    }
  }

  void authenticateUser() async {
    try {
      const authMessages = <AuthMessages>[
        AndroidAuthMessages(
          signInTitle: 'Biometric Authentication Required!',
          cancelButton: 'Cancel',
          biometricHint: 'Verify Your Identity',
          goToSettingsButton: 'Settings',
          goToSettingsDescription: 'Please setup your Fingerprint/Face',
        ),
        IOSAuthMessages(
          cancelButton: 'Cancel',
          goToSettingsButton: 'Settings',
          goToSettingsDescription: 'Please setup your Fingerprint/Face',
        ),
      ];
      isUserAuthenticated.value = await _localAuth.authenticate(
          localizedReason: 'Authenticate YourSelf', authMessages: authMessages);
      if (isUserAuthenticated.value) {
        showSnackBar('Authenticated Successfully', error: false);
      } else {
        showSnackBar('Failed Authentication', error: true);
      }
    } catch (e) {
      showSnackBar(e.toString(), error: true);
    }
  }

  @override
  void onInit() {
    super.onInit();
    getAvailableBiometrics();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }
}
