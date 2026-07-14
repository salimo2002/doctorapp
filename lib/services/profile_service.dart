import 'package:doctorapp/model/app_users.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ProfileService {
  static final _client = Supabase.instance.client;

  static Future<AppUsers> updateUser({
    required int userId,
    String? fullName,
    int? age,
    String? job,
  }) async {
    final response = await _client
        .from('app_users')
        .update({
          if (fullName != null) 'full_name': fullName,
          if (age != null) 'age': age,
          if (job != null) 'job': job,
        })
        .eq('id', userId)
        .select()
        .single();

    return AppUsers.fromJson(response);
  }

  static Future<AppUsers> getUser(int userId) async {
    final response = await _client
        .from('app_users')
        .select()
        .eq('id', userId)
        .single();

    return AppUsers.fromJson(response);
  }
}
