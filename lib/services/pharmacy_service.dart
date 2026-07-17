import 'package:doctorapp/model/on_duty_model.dart';
import 'package:doctorapp/model/pharmacy_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class PharmacyService {
  static final SupabaseClient supabase = Supabase.instance.client;

  static Future<List<PharmacyModel>> getAllPharmacies() async {
    final response = await supabase.from('pharmacies').select().order('name');

    return response.map((e) => PharmacyModel.fromJson(e)).toList();
  }

  static Future<List<OnDutyModel>> getTodayOnDuty() async {
    final today = DateTime.now().toIso8601String().split('T').first;

    final response = await supabase
        .from('on_duty_pharmacies')
        .select('*, pharmacies(*)')
        .eq('duty_date', today);

    return response.map((e) => OnDutyModel.fromJson(e)).toList();
  }
}
