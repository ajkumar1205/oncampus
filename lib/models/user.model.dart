import 'package:hive/hive.dart';
import 'package:intl/intl.dart';

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

  @HiveField(8)
  String? bio;

  @HiveField(9)
  String userName;

  User({
    required this.id,
    required this.firstname,
    required this.lastname,
    required this.email,
    required this.dob,
    required this.userName,
    this.profileUrl,
    required this.roll, // Initialize the new field
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      firstname: json['first_name'],
      userName: json['username'],
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
      'username': userName,
      'first_name': firstname,
      'last_name': lastname,
      'email': email,
      'dob': DateFormat('yyyy-MM-dd').format(dob),
      if (profileUrl != null) 'profile_url': profileUrl?.toString(),
      'roll': roll, 
      if (bio != null) 'bio': bio,
    };
  }
}
