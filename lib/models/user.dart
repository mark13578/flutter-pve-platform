class User {
  final String uuid;
  final String username;
  final String realname;
  final String phone;
  final String email;
  final String country;

  User({
    required this.uuid,
    required this.username,
    required this.realname,
    required this.phone,
    required this.email,
    required this.country,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      uuid: json['uuid'],
      username: json['username'],
      realname: json['realname'],
      phone: json['phone'],
      email: json['email'],
      country: json['country'],
    );
  }
}