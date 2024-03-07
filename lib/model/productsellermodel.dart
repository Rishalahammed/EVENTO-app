// class ProductsellerModel {
//   String? userId;
//   String companyName;
//   String email;
//   String mobNo;
//   String whastappNo;

//   ProductsellerModel({
//     this.userId,
//     required this.companyName,
//     required this.email,
//     required this.mobNo,
//     required this.whastappNo,
//   });

//   Map<String, dynamic> toMap(uid) => {
//         "regId": uid,
//         "CompanyName": companyName,
//         "Email": email,
//         "Mobile Number": mobNo,
//         "Whatsapp Number": whastappNo,
//       };

//   factory ProductsellerModel.fromMap(Map<String, dynamic> json) =>
//       ProductsellerModel(
//         companyName: json["CompanyName"],
//         email: json["Email"],
//         mobNo: json["Mobile Number"],
//         whastappNo: json["Whatsapp Number"],
//       );
// }
