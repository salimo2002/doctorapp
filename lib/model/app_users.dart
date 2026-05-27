class AppUsers {
  final int id;
  final String phoneNumber;
  final String password;
  final String? fullName;
  final int? age;
  final String? job;

  AppUsers({
    required this.id,
    required this.phoneNumber,
    required this.password,
    this.fullName,
    this.age,
    this.job,
  });
  factory AppUsers.fromJson(json) {
    return AppUsers(
      id: json['id'],
      phoneNumber: json['phone_number'],
      password: json['password'],
      fullName: json['full_name'] ?? '',
      age: json['age'] ?? 0,
      job: json['job'] ?? '',
    );
  }
  Map<String, dynamic> toMap() {
    return {
      'phone_number': phoneNumber,
      'password': password,
      'full_name': fullName ?? '',
      'age': age ?? 0,
      'job': job ?? '',
    };
  }
}
