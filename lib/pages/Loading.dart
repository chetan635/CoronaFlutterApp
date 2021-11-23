import 'package:flutter/material.dart';
import 'package:corona_app/pages/data.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


class Loading1 extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading1> {



  void setupWorldTime() async{
    Data instance=Data("https://api.covid19india.org/data.json");
    await instance.gatdata();
    Navigator.pushReplacementNamed(context, '/home',arguments: {
      'info':instance.info,

    });


  }

  int counter=0;
  @override
  void initState() {
    super.initState();
    setupWorldTime();

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white12,
      body: Center(
        child: SpinKitFadingCube(
          color: Colors.white,
          size: 80.0,
        ),
      ),
    );
  }
}
