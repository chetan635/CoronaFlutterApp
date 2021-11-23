import 'dart:ui';


import 'package:flutter/material.dart';
import 'package:corona_app/pages/data.dart';

import 'data3.dart';


class Extra extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<Extra> {




  Map data;
  Map data2;


  @override
  Widget build(BuildContext context) {

    data=ModalRoute.of(context).settings.arguments;
    List gra =data['info'];
    data2=data["index"];
    int p=0;
    gra.forEach((item) {
      p+=1;

    }) ;



    return Scaffold(
      appBar: AppBar(
        title: Text("Press For Statewise Analysis",
          style: TextStyle(
              letterSpacing: 1.0,
              color: Colors.white
          ),
        ),
        backgroundColor: Colors.pink,
        centerTitle: true,
      ),
      body:Container(
        width: 450,
        height: 700,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("lib/assects/india3.jfif"),
            fit: BoxFit.cover,
          ),
        ),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 1.5, sigmaY:1.5),
          child: Container(
            child: ListView.builder(
              itemCount: p,
              itemBuilder: (context,index){
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 50.0,horizontal: 7.0),

                  child: Card(

                    elevation: 1,
                    shadowColor: Colors.pink,
                    color: Colors.transparent,

                    child: ListTile(
                      onTap: (){

                        Navigator.pushNamed((context), '/extra2',arguments: {
                        'info2':gra[index]['districtData'],
                        'name':gra[index]["state"]
                        });


                      },
                      title:Column(
                        children: [
                          Text("${gra[index]["state"]}",
                          style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                            color: Colors.amberAccent
                          ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0.0, 20, 0.0, 20),
                            child: Text("TOTAL          ACTIVE         RECOVERED ",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.cyanAccent
                              ),

                            ),
                          ),
                          Text("${gra[index]["confirmed"]}       ${gra[index]["active"]}     ${gra[index]["recovered"]}",
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.white
                          ),
                          ),
                          Divider(
                            height: 30.0,
                            color: Colors.white,
                          ),
                          Text("UNFORTUNATE DEATHS",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.tealAccent

                          ),
                          ),
                          Text("${gra[index]["deaths"]}",
                            style: TextStyle(
                                fontSize: 26,
                              fontWeight: FontWeight.bold,
                              color: Colors.white
                            ),
                          )

                        ],
                      )

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
