import 'package:supabase_flutter/supabase_flutter.dart';

class FavoritesService {
  static final _client = Supabase.instance.client;

  static Future<void> addToFavorites({
    required int userId,
    required int drugId,
  }) async {
    await _client.from('favorite_drugs').insert({
      'user_id': userId,
      'drug_id': drugId,
    });
  }

  static Future<void> removeFromFavorites({
    required int userId,
    required int drugId,
  }) async {
    await _client
        .from('favorite_drugs')
        .delete()
        .eq('user_id', userId)
        .eq('drug_id', drugId);
  }

  static Future<List<int>> getFavoriteDrugIds(int userId) async {
    final response = await _client
        .from('favorite_drugs')
        .select('drug_id')
        .eq('user_id', userId);

    return List<int>.from(response.map((item) => item['drug_id']));
  }
}
