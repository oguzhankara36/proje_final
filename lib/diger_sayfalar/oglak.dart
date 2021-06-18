import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class oglak extends StatefulWidget{
  sayfa7 createState() => sayfa7();
}
class sayfa7 extends State<oglak>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("OĞLAK",
            style: TextStyle(color: Colors.black),),
        ),

        body: Column(children: <Widget>[
          Text(
            "OĞLAK BURÇ YORUMU",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),


          IntrinsicHeight(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        color: Colors.yellow,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text("HOŞGELDİNİZ"),
                            Image.network(
                                "https://cdn.bolgegundem.com/d/news/913098.jpg")
                          ],
                        ),
                      ),
                    ),
                    Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            " Oğlak burçlarının kişisel özellikleri oldukça belirgin durumlar göstermektedir."
                                " Yani bu burca sahip bireyler gelecek ile olan planlamalarını detaylı olarak yapmamaktadır. "
                                "Daha çok anın tadını çıkarmak adına yaşmaktadırlar. "
                                "Fakat bazı durumlarda gereksiz kuruntulara düşme durumları oluşmaktadır. "
                                "Tabi ki bu kuruntular oğlak burçlarının depresyon gibi psikolojik hastalıklara itmektedir."
                                " Bu nedenle oğlak burcuna sahip bireylerin oldukça dikkatli olmalarında fayda vardır. "
                                "İnsanlarla olan ilişkileri çok zordur. ",
                          ),
                        ]
                    ),
                  ]

              )

          )

        ])
    );
  }
}