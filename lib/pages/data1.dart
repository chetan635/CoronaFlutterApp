import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';


class Data1{

  List info;
  String url;
  Data1(this.url);

  Future<void> gatdata1() async{
    Response response =await get("$url");
    Map  data=jsonDecode(response.body);

    info=data["cases_time_series"];
    print(info);
  }

}