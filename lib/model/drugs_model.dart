class DrugsModel {
  final int id;
  final String name;
  final String indications;
  final String risks;
  final bool requiresPrescription;
  final bool isRare;

  DrugsModel({
    required this.id,
    required this.name,
    required this.indications,
    required this.risks,
    required this.requiresPrescription,
    required this.isRare,
  });
  factory DrugsModel.fromJson(json) {
    return DrugsModel(
      id: json['id'],
      name: json['name'],
      indications: json['indications'],
      risks: json['risks'],
      requiresPrescription: json['requires_prescription'],
      isRare: json['is_rare'],
    );
  }
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'indications': indications,
      'risks': risks,
      'requires_prescription': requiresPrescription,
      'is_rare': isRare,
    };
  }
}
