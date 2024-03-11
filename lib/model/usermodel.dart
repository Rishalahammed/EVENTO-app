class UserModel {
  // String type;
  String? userId;
  String userName;
  String userEmail;
  String imgUrl;

  UserModel({
    this.userId,
    required this.imgUrl,
    required this.userName,
    required this.userEmail,
  });

  Map<String, dynamic> toMap(uid) => {
        "UserId": uid,
        "Username": userName,
        "email": userEmail,
        "imgUrl":imgUrl
      };

  factory UserModel.fromMap(Map<String, dynamic> json) => UserModel(
        userName: json["Username"],
        userEmail: json["email"],
        imgUrl:json["imgUrl"]
      );
}
