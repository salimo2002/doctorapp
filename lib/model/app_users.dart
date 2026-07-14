class AppUsers {
  final int id;
  final String phoneNumber;
  final String password;
  final String? fullName;
  final int? age;
  final String? job;
  final bool isWhatsappVerified;

  AppUsers({
    required this.id,
    required this.phoneNumber,
    required this.password,
    this.fullName,
    this.age,
    this.job,
    required this.isWhatsappVerified,
  });

  factory AppUsers.fromJson(Map<String, dynamic> json) {
    return AppUsers(
      id: json['id'],
      phoneNumber: json['phone_number'],
      password: json['password'],
      fullName: json['full_name'] ?? '',
      age: json['age'] ?? 0,
      job: json['job'] ?? '',
      isWhatsappVerified: json['is_whatsapp_verified'] ?? false,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'phone_number': phoneNumber,
      'password': password,
      'full_name': fullName ?? '',
      'age': age ?? 0,
      'job': job ?? '',
      'is_whatsapp_verified': isWhatsappVerified,
    };
  }

  AppUsers copyWith({
    int? id,
    String? phoneNumber,
    String? password,
    String? fullName,
    int? age,
    String? job,
    bool? isWhatsappVerified,
  }) {
    return AppUsers(
      id: id ?? this.id,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      password: password ?? this.password,
      fullName: fullName ?? this.fullName,
      age: age ?? this.age,
      job: job ?? this.job,
      isWhatsappVerified:
          isWhatsappVerified ?? this.isWhatsappVerified,
    );
  }
}