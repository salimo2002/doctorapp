class UserModel {
  final int? id;
  final String phoneNumber;
  final String password;
  final String? fullName;
  final int? age;
  final String? job;
  final DateTime? createdAt;

  UserModel({
    this.id,
    required this.phoneNumber,
    required this.password,
    this.fullName,
    this.age,
    this.job,
    this.createdAt,
  });

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'],
      phoneNumber: map['phone_number'],
      password: map['password'],
      fullName: map['full_name'],
      age: map['age'],
      job: map['job'],
      createdAt: map['created_at'] != null
          ? DateTime.parse(map['created_at'])
          : null,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'phone_number': phoneNumber,
      'password': password,
      'full_name': fullName,
      'age': age,
      'job': job,
    };
  }
}