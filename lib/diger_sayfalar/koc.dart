import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class koc extends StatefulWidget{
  sayfa13 createState() => sayfa13();
}
class sayfa13 extends State<koc>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("KOÇ",
            style: TextStyle(color: Colors.black),),
        ),

        body: Column(children: <Widget>[
          Text(
            "KOÇ BURÇ YORUMU",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),


          IntrinsicHeight(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        color: Colors.teal,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text("HOŞGELDİNİZ"),
                            Image.network(
                                "https://i4.hurimg.com/i/hurriyet/75/750x422/5dbbd75bc03c0e1bdc2550f0.jpg")
                          ],
                        ),
                      ),
                    ),
                    Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            " Koç burçları kişisel olarak çabuk sinirlenebilen bireyler olarak bilinmektedir. "
                                "Arkadaş çevresi ve aileleri tarafına gözü kara olarak nitelendirilmelerine rağmen birçok durumda şefkatlidirler. "
                                "Özellikle bazı bireylerde uğurlu taş kavramı bulunmaktadır. "
                                "Bu burçların yaygın uğurlu taşları pırlanta, yakut, ameist ve demir olarak bilinmektedir. ",
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