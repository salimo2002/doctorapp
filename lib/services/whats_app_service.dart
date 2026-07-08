import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;

class WhatsAppService {
  static const String apiUrl = 'https://7107.api.greenapi.com';
  static const String idInstance = '7107614202';
  static const String apiTokenInstance =
      '9c91707591ad4183b1df25a8b05a23840159d9a718124ff3ab';

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
          "message": "رمز التحقق الخاص بك هو: $code",
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
