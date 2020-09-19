import 'package:local_auth/local_auth.dart';

class AuthController {
  final LocalAuthentication _auth = LocalAuthentication();

  Future<bool> _isBiometricAvailable() async {
    bool isAvailable = false;
    try {
      isAvailable = await _auth.canCheckBiometrics;
    } catch (ex) {
      print(ex);
      return false;
    }
    return isAvailable;
  }

  Future _getListOfBiometricTypes() async {
    try {
      await _auth.getAvailableBiometrics();
    } catch (ex) {
      print(ex);
    }
  }

  Future<bool> _isAuthenticated() async {
    try {
      bool isAuthenticated = await _auth.authenticateWithBiometrics(
          localizedReason: "É necesário a autenticação biométrica",
          useErrorDialogs: true,
          stickyAuth: true
      );
      return isAuthenticated;
    } catch (ex) {
      print(ex);
      return false;
    }
  }

  Future<int> authenticate() async {
    if (await _isBiometricAvailable()) {
      await _getListOfBiometricTypes();
      if (await _isAuthenticated()){
        return 0;

      }else{
       return 1;
      }
    }else{
      return 2;
    }
  }
}