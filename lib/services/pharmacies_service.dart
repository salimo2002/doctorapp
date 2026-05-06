import 'package:doctorapp/keys/supa_base_keys.dart';
import 'package:doctorapp/model/pharmacies_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class PharmaciesService {
  static final SupabaseClient supabaseClient = Supabase.instance.client;
  Future<List<PharmaciesModel>> getPharmacies() async {
    final response = await supabaseClient
        .from(SupaBaseKeys.pharmacies)
        .select()
        .order('name', ascending: true);
    final pharmacies = response
        .map((e) => PharmaciesModel.fromJson(e))
        .toList();
    return pharmacies;
  }
}
