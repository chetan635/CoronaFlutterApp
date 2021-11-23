



import 'package:corona_app/pages/Loading.dart';
import 'package:flutter/material.dart';
import 'package:corona_app/pages/home.dart';
import 'package:corona_app/pages/graph.dart';
import 'package:corona_app/pages/info.dart';
import 'package:corona_app/pages/extra.dart';
import 'package:corona_app/pages/extra2.dart';
import 'package:corona_app/pages/pai.dart';

void main() =>runApp(MaterialApp(
  initialRoute: '/',
  routes: {
    '/':(context) =>Loading1(),
    '/home':(context)=>Home(),
    '/graph':(context)=>Graph(),
    '/info':(context)=>Info(),
    '/extra':(context)=>Extra(),
    '/extra2':(context)=>Extra2(),
    '/pai':(context)=>Pai()




},
));

