import 'package:doctorapp/model/app_users.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AppAuthService {
  static final SupabaseClient _client = Supabase.instance.client;

  static Future<AppUsers?> register({
    required String phoneNumber,
    required String password,
    String? fullName,
    int? age,
    String? job,
  }) async {
    try {
      final existingUser = await _client
          .from('app_users')
          .select()
          .eq('phone_number', phoneNumber)
          .maybeSingle();

      if (existingUser != null) {
        throw Exception('المستخدم موجود مسبقاً');
      }

      final response = await _client
          .from('app_users')
          .insert({
            'phone_number': phoneNumber,
            'password': password,
            'full_name': fullName,
            'is_whatsapp_verified': false,
            'age': age,
            'job': job,
          })
          .select()
          .single();

      return AppUsers.fromJson(response);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  static Future<AppUsers?> login({
    required String phoneNumber,
    required String password,
  }) async {
    try {
      final user = await _client
          .from('app_users')
          .select()
          .eq('phone_number', phoneNumber)
          .maybeSingle();

      if (user == null) {
        throw Exception('لا يوجد حساب بهذا الرقم');
      }

      if (user['password'] != password) {
        throw Exception('كلمة المرور غير صحيحة');
      }

      return AppUsers.fromJson(user);
    } catch (e) {
      throw Exception(e.toString());
    }
  }
static Future<void> verifyUserPhone(String phone) async {
  try {
    final response = await _client
        .from('app_users')
        .update({
          'is_whatsapp_verified': true,
        })
        .eq('phone_number', phone)
        .select()
        .maybeSingle();

    if (response == null) {
      throw Exception('فشل تحديث حالة التحقق');
    }
  } catch (e) {
    throw Exception('خطأ أثناء تفعيل الحساب: ${e.toString()}');
  }
}
}