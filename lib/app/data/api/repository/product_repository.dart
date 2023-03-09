import 'dart:convert';

import 'package:ere/app/data/api/apibasehelper.dart';
import 'package:ere/app/data/model/productmodel.dart';

class ProductRepository {
  Future<ProductModel> showProduct() async {
    final response = await ApiBaseHelper.post(
        "https://whatsappshop.in/api/product/1442", {});
    print(response);
    return ProductModel.fromJson(json.decode(response));
  }
}
