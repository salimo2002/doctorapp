import 'missing_pharmacy_model.dart';

class DrugsModel {
  final int id;
  final String name;
  final String indications;
  final String risks;
  final bool requiresPrescription;
  final bool isRare;

  final List<MissingPharmacyModel> pharmacies;

  DrugsModel({
    required this.id,
    required this.name,
    required this.indications,
    required this.risks,
    required this.requiresPrescription,
    required this.isRare,
    required this.pharmacies,
  });

  factory DrugsModel.fromJson(Map<String, dynamic> json) {
    List<MissingPharmacyModel> pharmacyList = [];

    if (json['missing_drugs'] != null) {
      pharmacyList = (json['missing_drugs'] as List)
          .map((e) => MissingPharmacyModel.fromJson(e))
          .toList();
    }

    return DrugsModel(
      id: json['id'],
      name: json['name'],
      indications: json['indications'] ?? '',
      risks: json['risks'] ?? '',
      requiresPrescription: json['requires_prescription'] ?? false,
      isRare: json['is_rare'] ?? false,
      pharmacies: pharmacyList,
    );
  }
}