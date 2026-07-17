import 'pharmacy_model.dart';

class OnDutyModel {
  final int id;
  final String dutyDate;
  final String? startTime;
  final String? endTime;
  final PharmacyModel pharmacy;

  OnDutyModel({
    required this.id,
    required this.dutyDate,
    this.startTime,
    this.endTime,
    required this.pharmacy,
  });

  factory OnDutyModel.fromJson(Map<String, dynamic> json) {
    return OnDutyModel(
      id: json['id'],
      dutyDate: json['duty_date'],
      startTime: json['start_time'],
      endTime: json['end_time'],
      pharmacy: PharmacyModel.fromJson(json['pharmacies']),
    );
  }
}