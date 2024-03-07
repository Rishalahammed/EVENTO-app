// class ManagementModel {
//   String? userId;
//   String companyName;
//   String email;
//   String mobNo;
//   String whastappNo;

//   ManagementModel({
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

//   factory ManagementModel.fromMap(Map<String, dynamic> json) => ManagementModel(
//         companyName: json["CompanyName"],
//         email: json["Email"],
//         mobNo: json["Mobile Number"],
//         whastappNo: json["Whatsapp Number"],
//       );
// }
