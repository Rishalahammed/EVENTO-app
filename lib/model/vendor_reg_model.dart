class VendorRegModel {
  String? userId;
  String companyName;
  String email;
  String mobNo;
  String whastappNo;
  String type;
  String city;
  String state;
  String userName;
  String address;
  String image;

  VendorRegModel({
    this.userId,
    required this.address,
    required this.image,
    required this.city,
    required this.state,
    required this.userName,
    required this.type,
    required this.companyName,
    required this.email,
    required this.mobNo,
    required this.whastappNo,
  });

  Map<String, dynamic> toMap(uid) => {
        "regId": uid,
        "address": address,
        "image":image,
        "city": city,
        "state": state,
        "userName": userName,
        "type": type,
        "CompanyName": companyName,
        "Email": email,
        "Mobile Number": mobNo,
        "Whatsapp Number": whastappNo,
      };

  factory VendorRegModel.fromMap(Map<String, dynamic> json) => VendorRegModel(
        type: json["type"],
        image: json["image"],
        address: json["address"],
        userName: json["userName"],
        city: json["city"],
        state: json["state"],
        companyName: json["CompanyName"],
        email: json["Email"],
        mobNo: json["Mobile Number"],
        whastappNo: json["Whatsapp Number"],
      );
}
