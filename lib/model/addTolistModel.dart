import 'package:evento/model/productmodel.dart';
import 'package:evento/model/vendor_reg_model.dart';

class AddToListModel {
  String? docId;
  ProductModel productModel;
  VendorRegModel vendorRegModel;

  AddToListModel(
      { this.docId,
      required this.productModel,
      required this.vendorRegModel});
  Map<String, dynamic> toJson(id,productId,ventorID) => {
        "docId": id,
        "productModel": productModel.toMap(productId),
        "vendorRegModel": vendorRegModel.toMap(ventorID)
      };

  factory AddToListModel.fromJson(Map<String, dynamic> json) {
    return AddToListModel(
        docId: json["docId"],
        productModel: ProductModel.fromMap(json["productModel"]),
        vendorRegModel: VendorRegModel.fromMap(json["vendorRegModel"]));
  }
}
