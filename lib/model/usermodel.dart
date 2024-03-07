class UserModel {
  // String type;
  String? userId;
  String userName;
  String userEmail;

  UserModel({
    this.userId,
    required this.userName,
    required this.userEmail,
  });

  Map<String, dynamic> toMap(uid) => {
        "UserId": uid,
        "Username": userName,
        "email": userEmail,
      };

  factory UserModel.fromMap(Map<String, dynamic> json) => UserModel(
        userName: json["Username"],
        userEmail: json["email"],
      );
}
