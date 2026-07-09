import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;

class WhatsAppService {
  static const String apiUrl = 'https://7107.api.greenapi.com';
  static const String idInstance = '710722679013';
  static const String apiTokenInstance =
      'f80e0857345342a4882518f20bce29d9ad26213f3ecf482780';

  static Future<bool> sendOtp({
    required String phone,
    required String code,
  }) async {
    try {
      final url = Uri.parse(
        '$apiUrl/waInstance$idInstance/sendMessage/$apiTokenInstance',
      );

      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          "chatId": "$phone@c.us",
          "message": "مرحبا بك في تطبيق المستشار الطبي رمز التحقق هو:: $code",
        }),
      );

      if (response.statusCode == 200) {
        log('تم إرسال الرسالة');
        return true;
      } else {
        log(response.body);
        return false;
      }
    } catch (e) {
      log(e.toString());
      return false;
    }
  }
}
