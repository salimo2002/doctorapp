class PharmacyModel {
  final int id;
  final String name;
  final String address;
  final String phoneNumber;
  final double? latitude;
  final double? longitude;
  final String? openingTime;  // ✅ جديد
  final String? closingTime;  // ✅ جديد

  PharmacyModel({
    required this.id,
    required this.name,
    required this.address,
    required this.phoneNumber,
    this.latitude,
    this.longitude,
    this.openingTime,
    this.closingTime,
  });

  factory PharmacyModel.fromJson(Map<String, dynamic> json) {
    return PharmacyModel(
      id: json['id'],
      name: json['name'] ?? '',
      address: json['address'] ?? '',
      phoneNumber: json['phone_number'] ?? '',
      latitude: json['latitude'] != null
          ? double.tryParse(json['latitude'].toString())
          : null,
      longitude: json['longitude'] != null
          ? double.tryParse(json['longitude'].toString())
          : null,
      openingTime: json['opening_time'],  // ✅
      closingTime: json['closing_time'],  // ✅
    );
  }
}