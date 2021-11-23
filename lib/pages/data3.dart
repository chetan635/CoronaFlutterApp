import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';


class Data3{

  List info;
  String url;
  Data3(this.url);

  Future<void> gatdata3() async{
    Response response =await get("$url");
    List  data=jsonDecode(response.body);
    print(data);
    info=data;
    print(info);
  }

}