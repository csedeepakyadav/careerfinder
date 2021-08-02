import 'dart:convert';

import 'package:careerfinder/src/models/auth_response_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class AuthRepository {
  String baseUrl = "https://career-finder.aaratechnologies.in/job/api";
  Future<AuthResponseModel> login(
      {@required String email,
      @required String password,
      @required String userType}) async {
    AuthResponseModel _authModel;

    var body = {"email": email, "ps": password, "type": userType};

    try {
      var response =
          await http.post(Uri.parse("$baseUrl/login"), body: body, headers: {
        //  'Content-Type': 'application/json',
        //  'Accept': 'application/json'
        //  'Authorization': '',
      });
      print(response.body);
      if (response.statusCode == 200) {
        var responseBody = json.decode(response.body);
        print(responseBody);
        if (responseBody['staus'] == "true") {
          _authModel = AuthResponseModel(
              status: responseBody['staus'],
              message: responseBody['message'],
              name: responseBody['data']['name'],
              email: responseBody['message']);
          return _authModel;
        } else {
          _authModel = AuthResponseModel(
              status: responseBody['staus'],
              message: responseBody['message'],
              name: "",
              email: "");
          return _authModel;
        }
      } else {
        print("3");
        print('no response');
        _authModel = AuthResponseModel(
            status: "false",
            message: "Some Error Occured, Please Try Again Later",
            name: "",
            email: "");
        return _authModel;
        ;
      }
    } catch (e) {
      _authModel = AuthResponseModel(
          status: "false",
          message: "Some Error Occured, Please Try Again Later",
          name: "",
          email: "");
      return _authModel;
    }
  }

  Future<AuthResponseModel> signup(
      {@required String email,
      @required String password,
      @required String name,
      @required String mobileNumber,
      @required String userType}) async {
    var body = {
      "email": email,
      "ps": password,
      "name": name,
      "mno": mobileNumber,
      "type": userType
    };

    AuthResponseModel _authModel;

    try {
      var response =
          await http.post(Uri.parse("$baseUrl/signUp"), body: body, headers: {
        //  'Content-Type': 'application/json',
        // 'Accept': 'application/json'
        //  'Authorization': '',
      });
      print(response);
      if (response.statusCode == 200) {
        var responseBody = json.decode(response.body);
        print(responseBody);
        if (responseBody['staus'] == "true") {
          _authModel = AuthResponseModel(
              status: responseBody['staus'],
              message: responseBody['message'],
              name: "",
              email: responseBody['message']);
          return _authModel;
        } else {
          _authModel = AuthResponseModel(
              status: responseBody['staus'],
              message: responseBody['message'],
              name: "",
              email: "");
          return _authModel;
        }
      } else {
        print("3");
        print('no response');
        _authModel = AuthResponseModel(
            status: "false",
            message: "Some Error Occured, Please Try Again Later",
            name: "",
            email: "");
        return _authModel;
        ;
      }
    } catch (e) {
      _authModel = AuthResponseModel(
          status: "false",
          message: "Some Error Occured, Please Try Again Later",
          name: "",
          email: "");
      return _authModel;
    }
  }

  Future logout() async {}

  Future forgotPassword(
      {@required String email, @required String password}) async {}
}
