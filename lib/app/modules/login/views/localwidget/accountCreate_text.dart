import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

class CreateAccountText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(bottom: 20, top: 10),
      child: GestureDetector(
        // onTap: () => Get.toNamed(Routes.SINUP),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Dont Have an Account? ',
              // textAlign: TextAlign.center,
            ),
            Text("REGISTER",
                style: TextStyle(
                    color: Colors.green,
                    fontSize: 16,
                    fontWeight: FontWeight.bold))
          ],
        ),
      ),
    );
  }
}
