/////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////
class Productdt {
  String? product_title;
  String? product_description;
  int? product_price;
  String? img_url;

  Productdt(this.product_title, this.product_description, this.product_price,
      this.img_url);
}
////////////////////////////////////////////////////////////////////////////

// class exxModel {
//   // String type;
//   String? userId;
//   String userName;
//   String userEmail;
//   String mobNo;
//   String whastappNo;
//
//   // String password;
//   exxModel({
//     // required this.password,
//     this.userId,
//     required this.userName,
//     required this.userEmail,
//     required this.mobNo,
//     required this.whastappNo,
//     // required this.type,
//   });
//
//   Map<String, dynamic> toMap(id) => {
//         "regId": id,
//         "Username": userName,
//         "email": userEmail,
//         "Mobile Number": mobNo,
//         "Whatsapp Number": whastappNo,
//         // "type": type
//         // "password": password,
//       };
//
//   factory exxModel.fromMap(Map<String, dynamic> json) => exxModel(
//         // password: json["password"],
//         // type: json["type"]);
//         userName: json["Username"],
//         userEmail: json["email"],
//         mobNo: json["Mobile Number"],
//         whastappNo: json["Whatsapp Number"],
//       );
// }
