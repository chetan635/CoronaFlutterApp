import 'dart:ui';


import 'package:corona_app/pages/data3.dart';
import 'package:flutter/material.dart';
import 'package:corona_app/pages/data.dart';


class Home extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<Home> {

  void qwate(a) async{
    Data instance=Data(a);
    await instance.gatdata();

    Navigator.pushNamed((context), '/graph',arguments: {
      'info':instance.info,
    }


    );

  }

  void qwate4(a) async{
    Data3 instance=Data3(a);
    await instance.gatdata3();

    Navigator.pushNamed((context), '/extra',arguments: {
      'info':instance.info,
    }


    );

  }
  void qwate5(a) async{
    Data instance=Data(a);
    await instance.gatdata();

    Navigator.pushNamed((context), '/pai',arguments: {
      'info':instance.info,
    }


    );

  }
  Map data;


  @override
  Widget build(BuildContext context) {

    data=ModalRoute.of(context).settings.arguments;
    List gra =data['info'];
    int index=data['index'];
    int p=0;
    gra.forEach((item) {
      p+=1;

    }) ;
    String url;
    var co;
    if(index==null){
      p=p;
      url='lib/assects/india.jpg';
      co="white";
    }
    else{
      p=index+1;
      url="lib/assects/ima.jfif";
      co="pink";
    }






    return Scaffold(
      appBar: AppBar(
        title: Text("The Corona Virus update",
        style: TextStyle(
          letterSpacing: 1.0,
          color: Colors.white
        ),
        ),
        backgroundColor: Colors.pink,
        centerTitle: true,
      ),
      body:
      ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(0.0),
            child: Container(

              height: 920,

              width: double.maxFinite,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("$url"),
                  fit: BoxFit.fitHeight,
                ),

              ),
              child: ClipRRect( // make sure we apply clip it properly
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                  child: Container(
                    alignment: Alignment.center,
                    color: Colors.grey.withOpacity(0.2),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(10.0, 40.0, 10.0, 50.0),
                          child: Text(
                            "India : Corona Virus \n      Latest Update",
                            style: TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Card(
                                shadowColor: Colors.cyanAccent,
                                color: Colors.transparent,
                                elevation: 5,
                                child: ClipPath(
                                  child: Column(
                                    children: [
                                      Container(
                                        height: 50,
                                        width: 180,
                                        child: Center(
                                          child: Text("Daily Confirmed",
                                          style: TextStyle(fontSize: 24.0
                                          ,fontWeight: FontWeight.bold,
                                            color: Colors.red
                                          ),


                                          ),

                                        ),


                                      ),
                                      Container(
                                        child: Text("${gra[p-1]["dailyconfirmed"]}",
                                          style: TextStyle(
                                            fontSize: 28,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.yellow
                                          ),

                                        ),
                                      )
                                    ],
                                  ),


                                  clipper: ShapeBorderClipper(shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(3))),
                                ),


                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Card(
                                shadowColor: Colors.cyanAccent,
                                color: Colors.transparent,
                                elevation: 5,
                                child: ClipPath(
                                  child: Column(
                                    children: [
                                      Container(
                                        height: 50,
                                        width: 180,
                                        child: Center(
                                          child: Text("Daily Recovered",
                                            style: TextStyle(fontSize: 24.0
                                                ,fontWeight: FontWeight.bold,
                                                color: Colors.deepOrange
                                            ),


                                          ),

                                        ),


                                      ),
                                      Container(
                                        child: Text("${gra[p-1]["dailyrecovered"]}",
                                          style: TextStyle(
                                              fontSize: 28,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.yellow
                                          ),

                                        ),
                                      )
                                    ],
                                  ),


                                  clipper: ShapeBorderClipper(shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(3))),
                                ),

                              ),
                            ),
                          ],
                        ),
                        Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Card(
                                    shadowColor: Colors.cyanAccent,
                                    color: Colors.transparent,
                                    elevation: 5,
                                    child: ClipPath(
                                      child: Column(
                                        children: [
                                          Container(
                                            height: 50,
                                            width: 180,
                                            child: Center(
                                              child: Text("Date",
                                                style: TextStyle(fontSize: 24.0
                                                    ,fontWeight: FontWeight.bold,
                                                    color: Colors.tealAccent
                                                ),


                                              ),

                                            ),


                                          ),
                                  Container(
                                    child: Text("${gra[p-1]["date"]}",
                                      style: TextStyle(
                                          fontSize: 28,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.yellow
                                      ),

                                    ),
                                  )
                                ],
                              ),


                              clipper: ShapeBorderClipper(shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(3))),
                            ),

                          ),

                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0.0 ,20, 0.0, 0.0),
                          child: RaisedButton(

                            onPressed: (){
                              qwate("https://api.covid19india.org/data.json");
                            },
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(80.0)),
                            padding: EdgeInsets.all(0.0),
                            child: Ink(
                              decoration: BoxDecoration(
                                  gradient: LinearGradient(colors: [Colors.deepOrange, Colors.orange],
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                  ),
                                  borderRadius: BorderRadius.circular(20.0)
                              ),
                              child: Container(
                                constraints: BoxConstraints(maxWidth: 270.0, maxHeight: 36.0),
                                alignment: Alignment.center,
                                child: Text(
                                  ""
                                      "Graphical Analysis",
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
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0.0 ,10, 0.0, 0.0),
                          child: RaisedButton(

                            onPressed: (){
                              qwate4("https://api.covidindiatracker.com/state_data.json");
                            },
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(80.0)),
                            padding: EdgeInsets.all(0.0),
                            child: Ink(
                              decoration: BoxDecoration(
                                  gradient: LinearGradient(colors: [Colors.white70, Colors.white],
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                  ),
                                  borderRadius: BorderRadius.circular(20.0)
                              ),
                              child: Container(
                                constraints: BoxConstraints(maxWidth: 270.0, maxHeight: 36.0),
                                alignment: Alignment.center,
                                child: Text(
                                  ""
                                      "State Wise Analysis",
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
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0.0 ,10, 0.0, 0.0),
                          child: RaisedButton(

                            onPressed: (){
                              qwate5("https://api.covid19india.org/data.json");
                            },
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(80.0)),
                            padding: EdgeInsets.all(0.0),
                            child: Ink(
                              decoration: BoxDecoration(
                                  gradient: LinearGradient(colors: [Colors.greenAccent, Colors.green],
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                  ),
                                  borderRadius: BorderRadius.circular(20.0)
                              ),
                              child: Container(
                                constraints: BoxConstraints(maxWidth: 270.0, maxHeight: 36.0),
                                alignment: Alignment.center,
                                child: Text(
                                  ""
                                      "Pai Chart Analysis",
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
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: ExpansionTile(

                            title: Text(':       Summery        :',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 30.0,
                                  fontWeight: FontWeight.bold,
                                backgroundColor: Colors.transparent
                              ),),
                            leading: Icon(Icons.add_comment,
                              color: Colors.black,),
                            children: [
                              Card(
                                shadowColor: Colors.cyanAccent,
                                color: Colors.transparent,
                                elevation: 5,
                                child: ClipPath(
                                  child: Column(
                                    children: [
                                      Container(
                                        height: 50,
                                        width: 350,
                                        child: Center(
                                          child: Text("Total Confirmed",
                                            style: TextStyle(fontSize: 24.0
                                                ,fontWeight: FontWeight.bold,
                                                color: Colors.deepOrange
                                            ),


                                          ),

                                        ),


                                      ),
                                      Container(
                                        child: Text("${gra[p-1]["totalconfirmed"]}",
                                          style: TextStyle(
                                              fontSize: 28,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.yellow
                                          ),

                                        ),
                                      )
                                    ],
                                  ),


                                  clipper: ShapeBorderClipper(shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(3))),
                                ),

                              ),
                              Card(
                                shadowColor: Colors.cyanAccent,
                                color: Colors.transparent,
                                elevation: 5,
                                child: ClipPath(
                                  child: Column(
                                    children: [
                                      Container(
                                        height: 50,
                                        width: 350,
                                        child: Center(
                                          child: Text("ToTal Recovered",
                                            style: TextStyle(fontSize: 24.0
                                                ,fontWeight: FontWeight.bold,
                                                color: Colors.deepOrange
                                            ),


                                          ),

                                        ),


                                      ),
                                      Container(
                                        child: Text("${gra[p-1]["totalrecovered"]}",
                                          style: TextStyle(
                                              fontSize: 28,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.yellow
                                          ),

                                        ),
                                      )
                                    ],
                                  ),


                                  clipper: ShapeBorderClipper(shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(3))),
                                ),

                              ),
                              Card(
                                shadowColor: Colors.cyanAccent,
                                color: Colors.transparent,
                                elevation: 5,
                                child: ClipPath(
                                  child: Column(
                                    children: [
                                      Container(
                                        height: 50,
                                        width: 350,
                                        child: Center(
                                          child: Text("Total Deaths",
                                            style: TextStyle(fontSize: 24.0
                                                ,fontWeight: FontWeight.bold,
                                                color: Colors.deepOrange
                                            ),


                                          ),

                                        ),


                                      ),
                                      Container(
                                        child: Text("${gra[p-1]["totaldeceased"]}",
                                          style: TextStyle(
                                              fontSize: 28,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.yellow
                                          ),

                                        ),
                                      )
                                    ],
                                  ),


                                  clipper: ShapeBorderClipper(shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(3))),
                                ),

                              ),
                            ],
                          ),

                        )

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
