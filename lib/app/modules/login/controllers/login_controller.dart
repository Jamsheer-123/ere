import 'package:ere/app/data/api/repository/sinup_repository.dart';
import 'package:ere/app/routes/app_pages.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginController extends GetxController {
  TextEditingController mobilecontroller = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  final isLoading = false.obs;
  final count = 0.obs;

  void loginWithEmail() async {
    final msg = await AuthHelper().loginUser(
        mobilecontroller.text.trim(), passwordController.text.trim());

    showToastMsg(msg);
    if (msg != "Sucess") {
      return;
    }

    Get.offAllNamed(Routes.HOME);
  }

  bool validator() {
    String msg = "";
    if (mobilecontroller.text.isEmpty) {
      msg = "Enter valid user id";
    } else if (passwordController.text.isEmpty) {
      msg = "Please enter password";
    } else {
      return true;
    }

    showToastMsg(msg);

    return false;
  }

  @override
  void onInit() {
    super.onInit();
  }
}

void showToastMsg(String msg) {
  Fluttertoast.showToast(
    msg: msg,
    timeInSecForIosWeb: 1,
    textColor: Colors.black,
    backgroundColor: Colors.blueGrey[50],
  );
}
