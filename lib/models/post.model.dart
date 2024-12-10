class Post {
  int comments;
  String createdAt;
  String id;
  int likes;
  String text;
  String user;
  String username;

  Post(
      {required this.comments,
      required this.createdAt,
      required this.id,
      required this.likes,
      required this.text,
      required this.user,
      required this.username});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      comments: json['comments'],
      createdAt: json['created_at'],
      id: json['id'],
      likes: json['likes'],
      text: json['text'],
      user: json['user'],
      username: json['username'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['comments'] = comments;
    data['created_at'] = createdAt;
    data['id'] = id;
    data['likes'] = likes;
    data['text'] = text;
    data['user'] = user;
    data['username'] = username;
    return data;
  }
}
