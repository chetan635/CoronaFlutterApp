import 'dart:ui';

import 'package:corona_app/pages/data1.dart';
import 'package:corona_app/pages/info.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:corona_app/pages/data.dart';

import 'package:flutter_sparkline/flutter_sparkline.dart';


class Graph extends StatefulWidget {
  @override
  _GraphState createState() => _GraphState();
}

class _GraphState extends State<Graph> {

  void apple(a) async{
    Data1 instance=Data1(a);
    await instance.gatdata1();

    Navigator.pushNamed((context), '/info',arguments: {
      'info':instance.info,
    }


    );

  }

  Map data={};
  @override
  Widget build(BuildContext context) {
    data=ModalRoute.of(context).settings.arguments;
    List gra =data['info'];
    List<double> appppp=[];
    List<double> apppppp=[];
    List<double> appppppp=[];
    int p=0;
    gra.forEach((item) {
      appppp.add(double.parse(item["dailyconfirmed"]));
      apppppp.add(double.parse(item["dailyrecovered"]));
      appppppp.add(double.parse(item["dailydeceased"]));
      p+=1;

    }) ;





    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        title: Text("Overview Of the Pandemic",
          style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              color: Colors.white
          ),

        ),
        backgroundColor: Colors.pink,

      ),
      body: ListView(
        children: [
           Padding(
            padding: const EdgeInsets.all(0.0),
            child: Container(

              width: 500,
              height: 1200,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage('https://images.unsplash.com/photo-1588783948922-d2f155b13c89?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60'),
                  fit: BoxFit.cover,
                ),
              ),

              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 2.0, sigmaY:2.0),
                child: Container(
                  color: Colors.black.withOpacity(0.6),
                  child: Center(
                    child: Column(
                      children: [
                        Card(
                          color: Colors.transparent,
                          shadowColor: Colors.pink,
                          elevation: 25.0,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(2.0, 2.0, 2.0, 2.0),


                            child: Container(
                              color: Colors.transparent,
                              width: 350.0,
                              height: 250.0,
                              child: new Sparkline(
                                data: appppp,
                                fillMode: FillMode.below,
                                fillGradient: new LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [Colors.orange[900], Colors.orange[300]],
                                ),
                              ),

                            ),
                          ),
                        ),
                        Container(
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Center(
                                child: Text("      The Spread of \n Corona Virus in India",
                                    style: TextStyle(
                                        color: Colors.cyanAccent,
                                        fontSize: 26.0

                                    )
                                ),
                              ),

                            )
                        ),
                        Divider(
                          height: 40.0,
                          color: Colors.white,
                        ),
                        Card(
                          color: Colors.transparent,
                          shadowColor: Colors.pink,
                          elevation: 25.0,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(2.0, 2.0, 2.0, 2.0),


                            child: Container(
                              color: Colors.transparent,
                              width: 350.0,
                              height: 250.0,
                              child: new Sparkline(
                                data: apppppp,
                                fillMode: FillMode.below,
                                fillGradient: new LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [Colors.white,Colors.blue[100], Colors.white],
                                ),
                              ),

                            ),
                          ),
                        ),
                        Container(
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Center(
                                child: Text("Daily Recovery of \n Our Country:India",
                                    style: TextStyle(
                                        color: Colors.cyanAccent,
                                        fontSize: 26.0

                                    )
                                ),
                              ),

                            )
                        ),
                        Divider(
                          height: 10.0,
                          color: Colors.white,
                        ),
                        Card(
                          color: Colors.transparent,
                          shadowColor: Colors.pink,
                          elevation: 25.0,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(2.0, 2.0, 2.0, 2.0),


                            child: Container(
                              color: Colors.transparent,
                              width: 350.0,
                              height: 250.0,
                              child: new Sparkline(
                                data: appppppp,
                                fillMode: FillMode.below,
                                fillGradient: new LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [Colors.green, Colors.green],
                                ),
                              ),

                            ),
                          ),
                        ),
                        Container(
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Center(
                                child: Text("Unfortunate Deaths In India",
                                    style: TextStyle(
                                        color: Colors.cyanAccent,
                                        fontSize: 26.0

                                    )
                                ),
                              ),

                            )
                        ),
                        Divider(
                          height: 40.0,
                          color: Colors.white,
                        ),


                        Container(

                          child: RaisedButton(
                            onPressed: (){

                              apple("https://api.covid19india.org/data.json");
                            },
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(80.0)),
                            padding: EdgeInsets.all(0.0),
                            child: Ink(
                              decoration: BoxDecoration(
                                  gradient: LinearGradient(colors: [Colors.amber, Colors.pink],
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                  ),
                                  borderRadius: BorderRadius.circular(30.0)
                              ),
                              child: Container(
                                constraints: BoxConstraints(maxWidth: 300.0, maxHeight: 50.0),
                                alignment: Alignment.center,
                                child: Text(
                                  ""
                                      "To Know More..",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 19.0,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

            ),
          ),
        ],

      ),

    );
  }
}
