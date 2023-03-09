import 'dart:convert';

import 'sharedpreference.dart';

class UserManager {
  static var userId = '';
  static var userToken = '';
  static var isUserLoggedIn = false;
  // static UserFullDeatils userFullDeatils =
  //     UserFullDeatils(); // to save userFullDeatils adn access it all over the app

  static Future<void> intUser() async {
    userId = await SharedPreferenceManager.instance.getValueFor("userId");
    userToken = await SharedPreferenceManager.instance.getValueFor("userToken");
    isUserLoggedIn =
        await SharedPreferenceManager.instance.getBoolValueFor("isUserLoged");

    String js =
        await SharedPreferenceManager.instance.getValueFor("userFullDetails");

    // if (js.isNotEmpty) {
    //   UserManager.userFullDeatils = UserFullDeatils.fromJson(json.decode(js));
    // }
  }

  static Future<void> saveUserId(String id) async {
    SharedPreferenceManager.instance.setValue("userId", id);
  }

  static Future<void> saveUserToken(String id) async {
    SharedPreferenceManager.instance.setValue("userToken", id);
  }

  static Future<void> setUserLoginStatus(bool status) async {
    SharedPreferenceManager.instance.setBoolValue("isUserLoged", status);
  }

  static Future<void> logOutUser() async {
    SharedPreferenceManager.instance.clearDefaults();
  }

  // static Future<void> saveUserFullDeatils(
  //     // this saves UserDetails locally for further use
  //     UserFullDeatils userFullDeatils) async {
  //   SharedPreferenceManager.instance
  //       .setValue("userFullDetails", json.encode(userFullDeatils.toJson()));

  //   UserManager.userFullDeatils = UserFullDeatils.fromJson(json.decode(
  //       await SharedPreferenceManager.instance.getValueFor("userFullDetails")));
  // }
}
