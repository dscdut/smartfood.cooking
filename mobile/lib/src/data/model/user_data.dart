class UserData {
  UserData({
    this.email,
    this.username,
  });

  factory UserData.fromJson(Map<String, dynamic> json) => UserData(
        email: json['email'] as String?,
        username: json['username'] as String?,
      );

  final String? email;
  final String? username;
}
