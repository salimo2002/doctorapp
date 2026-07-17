class MissingPharmacyModel {
  final int id;
  final String pharmacyName;
  final String pharmacyPhone;

  MissingPharmacyModel({
    required this.id,
    required this.pharmacyName,
    required this.pharmacyPhone,
  });

  factory MissingPharmacyModel.fromJson(Map<String, dynamic> json) {
    return MissingPharmacyModel(
      id: json['id'],
      pharmacyName: json['pharmacy_name'] ?? '',
      pharmacyPhone: json['pharmacy_phone'] ?? '',
    );
  }
}