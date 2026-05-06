import 'dart:developer';

import 'package:doctorapp/keys/supa_base_keys.dart';
import 'package:doctorapp/model/drugs_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class DrugServices {
  static final SupabaseClient supabaseClient = Supabase.instance.client;
  static Future<List<DrugsModel>> getDrugs() async {
    final respnse = await supabaseClient
        .from(SupaBaseKeys.drugs)
        .select()
        .order('name', ascending: true);
    final drugs = respnse.map((e) => DrugsModel.fromJson(e)).toList();
    log(drugs[0].risks);
    return drugs;
  }
}
