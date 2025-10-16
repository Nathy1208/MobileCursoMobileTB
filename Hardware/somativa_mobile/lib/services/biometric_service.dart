import 'package:local_auth/local_auth.dart';

class BiometricService {
  final _auth = LocalAuthentication();

  Future<bool> canCheckBiometrics() async {
    return await _auth.canCheckBiometrics;
  }

  Future<bool> authenticate() async {
    final bool available = await _auth.isDeviceSupported() && await _auth.canCheckBiometrics;
    if (!available) return false;
    return await _auth.authenticate(
      localizedReason: 'Autentique para registrar seu ponto',
      options: const AuthenticationOptions(stickyAuth: false),
    );
  }
}
