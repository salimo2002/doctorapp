import 'package:doctorapp/keys/supa_base_keys.dart';
import 'package:doctorapp/model/drugs_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class DrugServices {
  static final SupabaseClient supabaseClient = Supabase.instance.client;
 static Future<List<DrugsModel>> getDrugs() async {
  final response = await supabaseClient
      .from(SupaBaseKeys.drugs)
      .select('*, missing_drugs(*)')
      .order('name', ascending: true);

  final drugs =
      response.map((e) => DrugsModel.fromJson(e)).toList();

  return drugs;
}

  static Future<void> addToFavorites({
    required int userId,
    required int drugId,
  }) async {
    try {
      final existing = await supabaseClient
          .from('favorite_drugs')
          .select()
          .eq('user_id', userId)
          .eq('drug_id', drugId)
          .maybeSingle();

      if (existing != null) {
        throw Exception('الدواء موجود بالفعل في المفضلة');
      }
      await supabaseClient.from('favorite_drugs').insert({
        'user_id': userId,
        'drug_id': drugId,
      });
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  static Future<void> removeFromFavorites({
    required int userId,
    required int drugId,
  }) async {
    try {
      await supabaseClient
          .from('favorite_drugs')
          .delete()
          .eq('user_id', userId)
          .eq('drug_id', drugId);
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
