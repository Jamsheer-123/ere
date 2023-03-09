import 'package:ere/app/modules/login/controllers/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginButton extends GetView<LoginController> {
  LoginButton({Key? key, required this.onss}) : super(key: key);
  void Function() onss;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10, bottom: 15, left: 30, right: 30),
      child: Obx(
        () => controller.isLoading.value
            ? Center(
                child: const CircularProgressIndicator(
                  color: Colors.black,
                ),
              )
            : TextButton(
                onPressed: controller.isLoading.value ? null : onss,
                style: ButtonStyle(
                  fixedSize: MaterialStateProperty.all(const Size(400, 50)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14.0),
                      side: const BorderSide(color: Colors.transparent),
                    ),
                  ),
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.black),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 70, vertical: 8),
                  child: Text(
                    'Sigin in',
                    style: TextStyle(color: Colors.grey),
                  ),
                )),
      ),
    );
  }
}
