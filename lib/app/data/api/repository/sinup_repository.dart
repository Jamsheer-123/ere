import 'dart:convert';

import 'package:ere/app/data/managers/user_manager.dart';
import 'package:http/http.dart' as http;

class AuthHelper {
  Future<String> loginUser(String email, String password) async {
    var map = <String, dynamic>{};
    map['emailormobile'] = email;
    map['password'] = password;

    var response = await http.post(
        Uri.parse("https://whatsappshop.in/api/customer/login"),
        body: map);

    if (response.statusCode == 200) {
      var loginArr = json.decode(response.body);

      if (loginArr['msg'] != "Success") {
        return loginArr['message'];
      }

      await UserManager.setUserLoginStatus(true);

      // String SAVE_KEY_NAME = loginArr['result']["user_id"].toString();

      // await UserManager.saveUserToken(loginArr['jwt_token']);
      // await UserManager.saveUserId(SAVE_KEY_NAME);

      // UserFullDeatils userFullDeatils =
      //     await UserFullDetailsRepository().fetchUserFullDetails();
      // await UserManager.saveUserFullDeatils(userFullDeatils);

      return loginArr['message'];
    } else {
      print(response.body);
      return "error occured";
    }
  }
}
