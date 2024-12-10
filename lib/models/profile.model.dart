class Profile {
  String? bio;
  String firstName;
  String id;
  String lastName;
  int posts;
  String username;

  Profile(
      {this.bio,
      required this.firstName,
      required this.id,
      required this.lastName,
      required this.posts,
      required this.username});

  factory Profile.fromJson(Map<String, dynamic> json) {
    return Profile(
      bio: json['bio'],
      firstName: json['first_name'],
      id: json['id'],
      lastName: json['last_name'],
      posts: json['posts'],
      username: json['username'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['bio'] = bio;
    data['first_name'] = firstName;
    data['id'] = id;
    data['last_name'] = lastName;
    data['posts'] = posts;
    data['username'] = username;
    return data;
  }
}
