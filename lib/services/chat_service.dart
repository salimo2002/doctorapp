import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;

class ChatService {
  static Future<String> askAboutDrug(String userQuery) async {
    try {
      final String myProxyUrl =
          'https://my-medical-proxy-api.onrender.com/ask-bot';

      final response = await http.post(
        Uri.parse(myProxyUrl),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({"userQuery": userQuery}),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        log(data['answer'].toString());
        return data['answer'].toString().trim();
      } else {
        return "حدث خطأ في استجابة السيرفر الوسيط: ${response.statusCode}";
      }
    } catch (e) {
      log(e.toString());
      return "خطأ في الاتصال بالسيرفر: $e";
    }
  }
}
