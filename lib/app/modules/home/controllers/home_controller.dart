import 'package:ere/app/data/api/repository/product_repository.dart';
import 'package:ere/app/data/model/productmodel.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  ProductRepository productRepository = ProductRepository();
  @override
  void onInit() {
    getData();
    super.onInit();
  }

  ProductModel? productModel;
  getData() async {
    var result = await productRepository.showProduct();

    productModel = result;
    update();
  }
}
