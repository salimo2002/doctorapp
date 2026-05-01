class PharmaciesModel {
  final int id;
  final String name;
  final String address;
  final DateTime openingTime;
  final DateTime closingTime;
  final String phoneNumber;

  PharmaciesModel({
    required this.id,
    required this.name,
    required this.address,
    required this.openingTime,
    required this.closingTime,
    required this.phoneNumber,
  });
  factory PharmaciesModel.fromJson(json) {
    return PharmaciesModel(
      id: json['id'],
      name: json['name'],
      address: json['address'],
      openingTime: json['opening_time'],
      closingTime: json['closing_time'],
      phoneNumber: json['phone_number'],
    );
  }
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'address': address,
      'opening_time': openingTime,
      'closing_time': closingTime,
      'phone_number': phoneNumber,
    };
  }
}
