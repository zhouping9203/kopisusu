import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:kopisusu/AppConfig.dart';
import 'package:kopisusu/bean/GuestUserBean.dart';
import 'package:kopisusu/http/HttpConfig.dart';
import 'package:kopisusu/http/SignGenerate.dart';

class HttpRequest {

  Map<String,String> get headers => {
    'Content-Type': 'application/json; charset=UTF-8',
    "language": "id",
    "version": "1.0.0",
    "device-type": "IOS",
    "api-version": "2.1",
    "app-name": AppConfig.appName,
    "place": "",
    "credito": "1",
    "User-Agent":""
  };

  Future<GuestUserBean> guestUserLogin(String phone,String simPhone,String isRoot,String phoneModel) async {
    Map<String,dynamic> body = {
      "phone": phone,
      "sim_phone": simPhone,
      "is_root": isRoot,
      "phoe_model": phoneModel
    };
    String sign = SignGenerate.generateSign(body);
    body["sign"] = sign;
    final response = await http.post(
      Uri.parse("${HttpConfig.domain}/kopisusu_server/guestUser/login"),
      headers: headers,
      body: jsonEncode(body),
    );

    if (response.statusCode == 201) {
      return GuestUserBean.fromJson(jsonDecode(response.body) as Map<String,dynamic>);
    } else {
      throw Exception('Failed to create album.');
    }
  }

  void test(){
    guestUserLogin("phone", "simPhone", "isRoot", "phoneModel").then((GuestUserBean bean){

    }).onError((dynamic error,StackTrace s){

    });
  }

  void test1() async{
    final guestUserBean = await guestUserLogin("phone", "simPhone", "isRoot", "phoneModel");

  }


}