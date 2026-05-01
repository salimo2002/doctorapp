class DailyInformationModel {
  final int id;
  final DateTime dailyDate;
  final String drugName;
  final String medicalInfo1;
  final String medicalInfo2;
  final String indication1;
  final String indication2;
  final String risks;

  DailyInformationModel({
    required this.id,
    required this.dailyDate,
    required this.drugName,
    required this.medicalInfo1,
    required this.medicalInfo2,
    required this.indication1,
    required this.indication2,
    required this.risks,
  });
  factory DailyInformationModel.fromJson(json) {
    return DailyInformationModel(
      id: json['id'],
      dailyDate: json['daily_date'],
      drugName: json['drug_name'],
      medicalInfo1: json['medical_info_1'],
      medicalInfo2: json['medical_info_2'],
      indication1: json['indication_1'],
      indication2: json['indication_2'],
      risks: json['risks'],
    );
  }
}
