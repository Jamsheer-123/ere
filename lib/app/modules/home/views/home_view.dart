import 'package:ere/app/data/api/repository/product_repository.dart';
import 'package:ere/app/data/model/productmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  ProductRepository productRepository = ProductRepository();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff1c272f),
          leading:
              IconButton(onPressed: () {}, icon: Icon(CupertinoIcons.back)),
          title: Text('WhatsAppshop'),
          centerTitle: true,
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Icon(
                Icons.shopping_cart_checkout,
                size: 25,
              ),
            ),
          ],
        ),
        body:
            //  GetBuilder<HomeController>(
            //     builder: (controller) => controller.productModel == null
            //         ? Center(child: CircularProgressIndicator())
            //         : SingleChildScrollView(
            //             child: Column(
            //               children: [Text(controller.productModel!.product.name)],
            //             ),
            //           )),
            FutureBuilder(
          future: productRepository.showProduct(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (!snapshot.hasData) {
              return CircularProgressIndicator();
            } else {
              ProductModel productModel = snapshot.data!;

              return SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          child: Text(productModel.product.name)),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      margin: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 0),
                      child: CarouselSlider.builder(
                        itemCount: 3,
                        options: CarouselOptions(
                          height: 120,
                          autoPlay: true,
                          reverse: false,
                          enableInfiniteScroll: false,
                          viewportFraction: 1,
                        ),
                        itemBuilder: ((context, index, realIndex) {
                          return buildImage(productModel.product.image);
                        }),
                      ),
                    )
                  ],
                ),
              );
            }
          },
        ));
  }
}

Widget buildImage(String image) {
  return GestureDetector(
    child: Container(
      padding: EdgeInsets.zero,
      margin: EdgeInsets.zero,
      width: double.infinity,
      child: Image(image: NetworkImage(image)),
    ),
  );
}
