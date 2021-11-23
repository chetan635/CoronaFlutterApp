import 'dart:ui';


import 'package:flutter/material.dart';
import 'package:corona_app/pages/data.dart';

import 'data3.dart';


class Extra2 extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<Extra2> {




  Map data;


  @override
  Widget build(BuildContext context) {

    data=ModalRoute.of(context).settings.arguments;
    List gra =data['info2'];
    String name2=data['name'];
    print(gra);


    int p=0;
    gra.forEach((item) {
      p+=1;

    }) ;
    String url;

    if(name2=="Maharashtra"){
       url="lib/assects/Maharashtra.jfif";
    }
    else if(name2=="Andhra Pradesh"){
      url="lib/assects/Andhra.jpg";
    }
    else if(name2=="Tamil Nadu"){
      url="lib/assects/Tamil.jpg";
    }
    else if(name2=="Karnataka"){
      url="lib/assects/Karnataka.jpg";
    }
    else if(name2=="Uttar Pradesh"){
      url="lib/assects/Uttar.jfif";
    }
    else if(name2=="Delhi"){
      url="lib/assects/Delhi.jfif";
    }
    else if(name2=="West bengal"){
      url="lib/assects/West.jpg";
    }
    else if(name2=="Bihar"){
      url="lib/assects/Bihar.jfif";
    }
    else if(name2=="Telangana"){
      url="lib/assects/Andhra.jpg";
    }
    else if(name2=="Assam"){
      url="lib/assects/Assam.jfif";
    }
    else if(name2=="Odisha"){
      url="lib/assects/Odisha.jpg";
    }
    else if(name2=="Gujarat"){
      url="lib/assects/Gujrat.jpg";
    }
    else if(name2=="Rajasthan"){
      url="lib/assects/raj.jpg";
    }
    else if(name2=="Kerala"){
      url="lib/assects/kar.jpg";
    }
    else if(name2=="Haryana"){
      url="lib/assects/Har.jpg";
    }
    else if(name2=="Madhya Pradesh"){
      url="lib/assects/Madhya.jpg";
    }
    else if(name2=="Punjab"){
      url="lib/assects/Pun.jpg";
    }
    else if(name2=="Jharkhand"){
      url="lib/assects/Jhar.jpg";
    }
    else if(name2=="Jammu and Kashmir"){
      url="lib/assects/Kas.jpg";
    }
    else if(name2=="Chhattisgarh"){
      url="lib/assects/Chh.jpg";
    }
    else if(name2=="Uttarakhand"){
      url="lib/assects/Utt.jpg";
    }
    else if(name2=="Goa"){
      url="lib/assects/Goa.jpg";
    }
    else if(name2=="Puducherry"){
      url="lib/assects/Pudd.jpg";
    }
    else if(name2=="Tripura"){
      url="lib/assects/Tri.jpg";
    }
    else if(name2=="Himachal Pradesh"){
      url="lib/assects/Him.jpg";
    }
    else if(name2=="Manipur"){
      url="lib/assects/Manipur.jpg";
    }
    else if(name2=="Chandigarh"){
      url="lib/assects/Cha.jpg";
    }
    else if(name2=="Arunachal Pradesh"){
      url="lib/assects/Aru.jpg";
    }
    else if(name2=="Nagaland"){
      url="lib/assects/Nag.jpg";
    }
    else if(name2=="Andaman and Nicobar Islands"){
      url="lib/assects/And.jpg";
    }
    else if(name2=="Ladakh"){
      url="lib/assects/lad.jpg";
    }
    else if(name2=="Meghalaya"){
      url="lib/assects/Meg.jpg";
    }
    else if(name2=="Sikkim"){
      url="lib/assects/Sik.jpg";
    }
    else if(name2=="Daman and Diu"){
      url="lib/assects/india.jfif";
    }
    else if(name2=="Dadra and Nagar Haveli"){
      url="lib/assects/india.jfif";
    }
    else if(name2=="Mizoram"){
      url="lib/assects/india.jfif";
    }
    else if(name2=="Lakshadweep"){
      url="lib/assects/india.jfif";
    }










    return Scaffold(
        appBar: AppBar(
          title: Text("District Wise Analysis",
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
              image: AssetImage(url),
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
                    padding: const EdgeInsets.symmetric(vertical: 15.0,horizontal: 7.0),

                    child: Card(

                      elevation: 1,
                      shadowColor: Colors.grey[900],
                      color: Colors.transparent,


                          child:Column(
                            children: [
                              Text("${gra[index]["id"]}",
                                style: TextStyle(
                                    fontSize: 35,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.yellow
                                ),
                              ),
                              Divider(
                                height: 15.0,
                                color: Colors.white,
                              ),
                              Text("TOTAL    ",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.cyanAccent
                                ),

                              ),
                              Divider(
                                height: 15.0,
                                color: Colors.white,
                              ),
                              Text("${gra[index]["confirmed"]}      ",
                                style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white
                                ),
                              ),

                            ],
                          )

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
