class AllUserModel {
  String? userId;
  String email;
  String type;

  AllUserModel({
    required this.email,
    required this.type,
    this.userId,
  });
  Map<String, dynamic> toJson(uid) => {
        "userId": uid,
        "email": email,
        "type": type,
      };

  factory AllUserModel.fromJson(Map<String, dynamic> json) => AllUserModel(
        email: json["email"],
        type: json["type"],
        userId: json["userId"],
      );
}
