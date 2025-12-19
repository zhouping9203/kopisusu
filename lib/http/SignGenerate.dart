import 'dart:convert';
import 'package:crypto/crypto.dart';

class SignGenerate {

  static const _secretKey = "8GWeRtjQs9xHR5Y4h162";

  static String generateSign(Map<String, dynamic> params){
    String result = params.entries.map((MapEntry<String,dynamic> element){
      "${element.key}=${element.value}";
    }).join("&");
    result = md5.convert(utf8.encode("$result&secret_key=$_secretKey")).toString();
    return result;
  }

}