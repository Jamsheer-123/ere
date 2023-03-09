import 'dart:convert';
import 'dart:io';
import 'package:ere/app/data/api/app_exeption.dart';
import 'package:ere/app/data/managers/user_manager.dart';
import 'package:http/http.dart' as http;

class ApiBaseHelper {
  static Map<String, String> commonHeaders = {
    'Content-Type': 'application/json; charset=utf-8',
  };

  static Future<dynamic> get(String url,
      {bool isHeaderRequired = false}) async {
    // ignore: prefer_typing_uninitialized_variables
    var responseJson;
    if (isHeaderRequired) {
      await UserManager.intUser();
      var token = UserManager.userToken;
      print(token);

      commonHeaders.addAll({'Authorization': 'Bearer $token'});
    }
    try {
      final response = await http.get(Uri.parse(url), headers: commonHeaders);
      responseJson = _returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  static Future<dynamic> postUploadImage(String url,
      dynamic bodyExceptImageField, String imageField, File image) async {
    print('Api Post, url $url');
    await UserManager.intUser();
    String token = UserManager.userToken;
    commonHeaders.addAll(
        {'Authorization': 'Bearer $token', "Accept": "application/json"});

    var stream = http.ByteStream(image.openRead());
    stream.cast();

    //var length = await image.length();

    var multipart = await http.MultipartFile.fromPath(imageField, image.path);

    var uri = Uri.parse(url);

    var request = http.MultipartRequest('POST', uri);

    request.headers.addAll(commonHeaders);

    request.fields.addAll(bodyExceptImageField);

    request.files.add(multipart);

    var streamedResponse = await request.send();

    //var response = await http.Response.fromStream(streamedResponse);

    //var response = streamedResponse.stream.bytesToString();

    //var responseJson = _returnResponse(response);

    if (streamedResponse.statusCode == 200) {
      print("success__________________________________________");
      var response = await streamedResponse.stream.bytesToString();
      return response;
    } else {
      print(streamedResponse.statusCode);
      print(await streamedResponse.stream.bytesToString());
    }
  }

  static Future<dynamic> post(String url, dynamic body,
      {bool isHeaderRequired = true}) async {
    print('Api Post, url $url');
    var responseJson;

    if (isHeaderRequired) {
      await UserManager.intUser();
      var token = UserManager.userToken;
      print(token);

      commonHeaders.addAll({'Authorization': 'Bearer $token'});
    }

    try {
      final response = await http.post(Uri.parse(url),
          body: json.encode(body), headers: commonHeaders);
      responseJson = _returnResponse(response);

      // print(
      //     "------------------------track lineStart--------------------------------");
      // print(
      //     "------------------------track line--------------------------------");
      // print(
      //     "------------------------track line--------------------------------");
      // print(
      //     "------------------------track line--------------------------------");
      // print(
      //     "------------------------track line--------------------------------");
      // print(
      //     "------------------------track lineEnd--------------------------------");

      // print(url);
      // print(response.body);
    } on SocketException {
      print('No net');
      throw FetchDataException('No Internet connection');
    }
    print('api post.');
    return responseJson;
  }

  static Future<dynamic> put(String url, dynamic body,
      {bool isHeaderRequired = false}) async {
    print(body.toString());
    print('Api Put, url $url');
    if (isHeaderRequired) {
      await UserManager.intUser();
      var token = UserManager.userToken;
      commonHeaders.addAll({'Authorization': 'Bearer $token'});
    }
    var responseJson;
    try {
      final response = await http.put(Uri.parse(url),
          body: json.encode(body), headers: commonHeaders);
      responseJson = _returnResponse(response);
    } on SocketException {
      print('No net');
      throw FetchDataException('No Internet connection');
    }
    print('api put.');
    print(responseJson.toString());
    return responseJson;
  }

  static Future<dynamic> delete(String url,
      {dynamic body = null, bool isHeaderRequired = false}) async {
    print('Api delete, url $url');

    await UserManager.intUser();
    String token = UserManager.userToken;
    commonHeaders.addAll({'Authorization': 'Bearer $token'});

    var apiResponse;
    try {
      final response =
          await http.delete(Uri.parse(url), headers: commonHeaders);
      apiResponse = _returnResponse(response);
    } on SocketException {
      print('No net');
      throw FetchDataException('No Internet connection');
    }
    print('api delete.');
    return apiResponse;
  }
}

dynamic _returnResponse(http.Response response) {
  switch (response.statusCode) {
    case 200:
      //var responseJson = json.decode(response.body.toString());
      print(response.body.toString());
      return response.body.toString();
    case 400:
      throw BadRequestException(response.body.toString());
    case 401:
    case 403:
      throw UnauthorisedException(response.body.toString());
    case 500:
    default:
      throw FetchDataException(
          'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
  }
}
