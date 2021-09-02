class UserModel {
  UserModel(
      {required this.userId,
      required this.email,
      required this.name,
      required this.pic});

  UserModel.fromJson(Map<String, Object?> json)
      : this(
          userId: json['userId']! as String,
          email: json['email']! as String,
          name: json['name']! as String,
          pic: json['pic']! as String,
        );

  final String? userId, email, name, pic;

  Map<String, Object?> toJson() {
    return {
      'userId': userId,
      'email': email,
      'name': name,
      'pic': pic,
    };
  }
}
