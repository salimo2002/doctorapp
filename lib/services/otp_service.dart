import 'dart:math';
import 'package:doctorapp/keys/otp_code.dart';
import 'package:doctorapp/services/whats_app_service.dart';

class OtpService {
  static String _generateOtp() {
    final random = Random();
    return (100000 + random.nextInt(900000)).toString();
  }

  static Future<bool> sendOtp(String phone) async {
    final code = _generateOtp();
    OtpCode.otp = code;
    return await WhatsAppService.sendOtp(phone: phone, code: code);
  }

  static bool verifyOtp(String enteredCode) {
    return enteredCode.trim() == OtpCode.otp;
  }
}
