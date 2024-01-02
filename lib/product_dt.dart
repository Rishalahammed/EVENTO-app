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

/////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////

class ProductModel {
  String? product_id;
  String product_description;
  String product_category;
  int product_prize;
  // String? img_url;
  ProductModel({
    this.product_id,
    required this.product_description,
    required this.product_category,
    required this.product_prize,
  });

  Map<String, dynamic> toMap(id) => {
        "productId": id,
        "Description": product_description,
        "Category": product_category,
        "Prize": product_prize,
      };

  factory ProductModel.fromMap(Map<String, dynamic> json) => ProductModel(
        product_description: json["Description"],
        product_category: json["Category"],
        product_prize: json["Mobile Prize"],
      );
}

/////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////

class ExModel {
  // String type;
  String? userId;
  String userName;
  String userEmail;

  ExModel({
    this.userId,
    required this.userName,
    required this.userEmail,
  });

  Map<String, dynamic> toMap(id) => {
        "UserId": id,
        "Username": userName,
        "email": userEmail,
      };

  factory ExModel.fromMap(Map<String, dynamic> json) => ExModel(
        userName: json["Username"],
        userEmail: json["email"],
      );
}

////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////

class UserModel {
  // String type;
  String? userId;
  String userName;
  String userEmail;
  String mobNo;
  String whastappNo;

  // String password;
  UserModel({
    // required this.password,
    this.userId,
    required this.userName,
    required this.userEmail,
    required this.mobNo,
    required this.whastappNo,

    // required this.type,
  });

  Map<String, dynamic> toMap(id) => {
        "regId": id,
        "Username": userName,
        "email": userEmail,
        "Mobile Number": mobNo,
        "Whatsapp Number": whastappNo,
        // "type": type
        // "password": password,
      };

  factory UserModel.fromMap(Map<String, dynamic> json) => UserModel(
        // password: json["password"],
        // type: json["type"]);
        userName: json["Username"],
        userEmail: json["email"],
        mobNo: json["Mobile Number"],
        whastappNo: json["Whatsapp Number"],
      );
}
