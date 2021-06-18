import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class akrep extends StatefulWidget{
  sayfa11 createState() => sayfa11();
}
class sayfa11 extends State<akrep>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("AKREP",
            style: TextStyle(color: Colors.black),),
        ),

        body: Column(children: <Widget>[
          Text(
            "AKREP BURÇ YORUMU",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),


          IntrinsicHeight(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,

                  children: <Widget>[
                    Expanded(
                      child: Container(
                        color: Colors.red,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text("HOŞGELDİNİZ"),
                            Image.network(
                                "https://www.finansajans.com/wp-content/uploads/2020/06/akrep-burcu-2020-temmuz-ayı-yorumları-1024x576.jpg")
                          ],

                        ),

                      ),
                    ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
          Text(
            "Akrep burcu olan kişiler öncelikle hiçbir işi yarım bırakmazlar."
                " Akrep burcu olan kişilerin genel olarak güçleri gözlerinden okunmaktadır."
                " Mimiklerini kontrol altında tutmaya çalışsalar bile, bakışları ile birlikte "
                "sevgilerini ve ya nefretlerini aktarabilirler. Akrep burcu olan kişiler genelde "
                "ukala ve kendini beğenmiş olan insanları sevmezler ve onları aşağılayarak hadlerini "
                "bildirmeye çalışırlar. Akrep burcu olan kişiler genel olarak kendi bildiklerini okuyan "
                "kişiler olup uzlaşmaya yanaşmazlar. Ayrıca aşırı bir şekilde kuşkucu olurlar ve kolay "
                "kolay inanmazlar. Çalışmalarında ise genel olarak sabır ve özen ile çalışırlar iken "
                "gösterişten uzak şekilde işlerini de yaparlar.",
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