class UserData {
  String? email;
  String? username;

  UserData({this.email, this.username});

  factory UserData.fromJson(Map<String, dynamic> json) =>
      UserData(email: json["email"], username: json["username"]);
}
