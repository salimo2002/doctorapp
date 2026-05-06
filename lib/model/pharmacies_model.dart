class PharmaciesModel {
  final int id;
  final String name;
  final String address;
  final String openingTime;
  final String closingTime;
  final String phoneNumber;
  final double latitude;
  final double longitude;

  PharmaciesModel({
    required this.id,
    required this.name,
    required this.address,
    required this.openingTime,
    required this.closingTime,
    required this.phoneNumber,
    required this.latitude,
    required this.longitude,
  });
  factory PharmaciesModel.fromJson(json) {
    return PharmaciesModel(
      id: json['id'],
      name: json['name'],
      address: json['address'],
      openingTime: json['opening_time'],
      closingTime: json['closing_time'],
      phoneNumber: json['phone_number'],
      latitude: json['latitude'],
      longitude: json['longitude'],
    );
  }
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'address': address,
      'opening_time': openingTime,
      'closing_time': closingTime,
      'phone_number': phoneNumber,
      'latitude': latitude,
      'longitude': longitude,
    };
  }
}
