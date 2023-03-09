import 'dart:ui';

import 'package:ere/app/modules/login/views/localwidget/accountCreate_text.dart';
import 'package:ere/app/modules/login/views/localwidget/custom_textfield.dart';
import 'package:ere/app/modules/login/views/localwidget/login_button.dart';
import 'package:ere/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: SingleChildScrollView(
        child: Form(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 100,
              ),
              WhatsappText(),
              SizedBox(
                height: 40,
              ),
              CustomTextField(
                  hintText: "Enter Email/Mobile Number",
                  keybord: TextInputType.name,
                  controls: controller.mobilecontroller),
              CustomTextField(
                  hintText: "Enter Password",
                  keybord: TextInputType.name,
                  controls: controller.passwordController),
              LoginButton(
                onss: () {
                  Get.toNamed(Routes.HOME);
                  // if (controller.validator()) {
                  //   try {
                  //     controller.loginWithEmail();
                  //   } catch (error) {
                  //     // showToastMsg(error.toString());
                  //   }
                  // }
                },
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 15),
                alignment: Alignment.centerRight,
                child: TextButton(
                    onPressed: () {},
                    child: Text(
                      "Forget Password",
                      style: TextStyle(color: Colors.red),
                    )),
              ),
              Center(child: CreateAccountText())
            ],
          ),
        ),
      )),
    );
  }
}

class WhatsappText extends StatelessWidget {
  const WhatsappText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      alignment: Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            textAlign: TextAlign.start,
            "Welcome to ",
            style: TextStyle(color: Colors.black, fontSize: 25),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            textAlign: TextAlign.start,
            "WhatsAppShop",
            style: TextStyle(color: Colors.green, fontSize: 25),
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            "sign in",
            style: TextStyle(color: Colors.grey, fontSize: 16),
          ),
        ],
      ),
    );
  }
}
// FFEBEBEB