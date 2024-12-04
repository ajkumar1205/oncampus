import 'package:hive/hive.dart';

part 'user.model.g.dart';

@HiveType(typeId: 0) // Assign a unique typeId for the class
class User {
  @HiveField(0)
  String id;

  @HiveField(1)
  String firstname;

  @HiveField(2)
  String lastname;

  @HiveField(3)
  String email;

  @HiveField(4)
  DateTime dob;

  @HiveField(5)
  bool isActive = false;

  @HiveField(6)
  Uri? profileUrl;

  @HiveField(7)
  String roll; // New field

  User({
    required this.id,
    required this.firstname,
    required this.lastname,
    required this.email,
    required this.dob,
    this.profileUrl,
    required this.roll, // Initialize the new field
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      firstname: json['first_name'],
      lastname: json['last_name'],
      email: json['email'],
      dob: DateTime.parse(json['dob']),
      profileUrl:
          json['profile_url'] != null ? Uri.parse(json['profile_url']) : null,
      roll: json['roll'], // Parse the new field
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'first_name': firstname,
      'last_name': lastname,
      'email': email,
      'dob': dob.toIso8601String(),
      'profile_url': profileUrl?.toString(),
      'roll': roll, // Add the new field
    };
  }
}