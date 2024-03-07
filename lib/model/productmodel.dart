class ProductModel {
  String? product_id;
  String product_description;
  String product_category;
  int product_prize;
  String? img_url;
  String vendorId;
  String vendorType;

  ProductModel(
      {this.product_id,
      required this.vendorId,
      required this.vendorType,
      required this.product_description,
      required this.product_category,
      required this.product_prize,
      required this.img_url});

  Map<String, dynamic> toMap(uid) => {
        "productId": uid,
        "vendorId":vendorId,
        "vendorType":vendorType,
        "Description": product_description,
        "Category": product_category,
        "Prize": product_prize,
        "img_url": img_url
      };

  factory ProductModel.fromMap(Map<String, dynamic> json) => ProductModel(
        product_description: json["Description"],
        vendorId: json["vendorId"],
         vendorType:json["vendorType"] ,
        product_category: json["Category"],
        product_prize: json["Prize"],
        img_url: json["img_url"],
      );
}
