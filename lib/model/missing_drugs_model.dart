class MissingDrugsModel {
  final int id;
  final int drugId;
  final String pharmacyName;
  final String pharmacyPhone;

  MissingDrugsModel({
    required this.id,
    required this.drugId,
    required this.pharmacyName,
    required this.pharmacyPhone,
  });
  factory MissingDrugsModel.fromJson(json) {
    return MissingDrugsModel(
      id: json['id'],
      drugId: json['drug_id'],
      pharmacyName: json['pharmacy_name'],
      pharmacyPhone: json['pharmacy_phone'],
    );
  }
  Map<String, dynamic> toMap() {
    return {
      'drug_id': drugId,
      'pharmacy_name': pharmacyName,
      'pharmacy_phone': pharmacyPhone,
    };
  }
}
