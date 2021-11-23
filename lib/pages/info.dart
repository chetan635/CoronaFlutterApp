import 'dart:ui';

import 'package:corona_app/pages/info.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:corona_app/pages/data.dart';

import 'package:flutter_sparkline/flutter_sparkline.dart';


class Info extends StatefulWidget {
  @override
  _GraphState createState() => _GraphState();
}

class _GraphState extends State<Info> {


  void qwate2(a,index,p) async{
    Data instance=Data(a);
    await instance.gatdata();

    Navigator.pushNamed((context), '/home',arguments: {
      'info':instance.info,
      "index":p-index-1
    }


    );

  }

  Map data={};




  @override
  Widget build(BuildContext context) {
    data=ModalRoute.of(context).settings.arguments;
    List gra =data['info'];
    int p=0;
    gra.forEach((item) {
      p+=1;

    }) ;


    return Scaffold(
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
      body: Container(
        width: 500,
        height: 1200,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage('https://images.unsplash.com/photo-1585240988294-5f2fd1dd0e9d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=675&q=80'),
            fit: BoxFit.cover,
          ),
        ),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 2.0, sigmaY:2.0),
          child: Container(
            child: ListView.builder(
              itemCount: p,
              itemBuilder: (context,index){
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 7.0),
                  child: Card(

                    elevation: 1,
                    shadowColor: Colors.tealAccent,
                    color: Colors.transparent,

                    child: ListTile(
                      onTap: (){
                        qwate2("https://api.covid19india.org/data.json", index,p);

                      },
                      title: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(65.0, 5, 5, 5),
                                  child: Center(child: Text("Date",
                                    style: TextStyle(
                                        fontSize: 25.0,
                                        fontWeight: FontWeight.bold,
                                      color: Colors.cyanAccent
                                    ),
                                  )),
                                ),
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(65.0, 5, 5, 5),
                                  child: Center(child: Text("New Cases",
                                  style: TextStyle(
                                    fontSize: 25.0,
                                    fontWeight: FontWeight.bold,
                                      color: Colors.tealAccent
                                  ),
                                  )),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(30.0, 5, 5, 5),
                                  child: Center(child: Text("${gra[p-index-1]["date"]}",
                                    style: TextStyle(
                                        fontSize: 25.0,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.amberAccent
                                    ),
                                  )),
                                ),
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(40.0, 5, 5, 5),
                                  child: Center(child: Text("${gra[p-index-1]["dailyconfirmed"]}",
                                    style: TextStyle(
                                        fontSize: 25.0,
                                        fontWeight: FontWeight.bold,
                                      color: Colors.amberAccent
                                    ),
                                  )),
                                ),
                              ],
                            ),
                          ],


                        )
                      ),

                    ),
                  ),
                );
              },
            ),
          ),
        ),
      )
    );
  }
}
