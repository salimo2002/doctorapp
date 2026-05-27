import 'package:doctorapp/keys/supa_base_keys.dart';
import 'package:doctorapp/model/daily_information_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class DailyInformationService {
  static final SupabaseClient supabase = Supabase.instance.client;
  static Future<DailyInformationModel> getTodayInformation() async {
    final today = DateTime.now().toIso8601String().split('T')[0];
    final response = await supabase
        .from(SupaBaseKeys.dailyInfo)
        .select()
        .eq('daily_date', today)
        .limit(1)
        .single();
    final dailyInfo = DailyInformationModel.fromJson(response);
    return dailyInfo;
  }
}
