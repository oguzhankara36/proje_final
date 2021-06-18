import 'package:flutter/material.dart';

class ikizler extends StatefulWidget{

  sayfa4 createState() => sayfa4();
}

class sayfa4 extends State<ikizler> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("İKİZLER",
            style: TextStyle(color: Colors.black),),
        ),

        body: Column(children: <Widget>[
          Text(
            "İKİZLER BURC YORUMU",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),


          IntrinsicHeight(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        color: Colors.black,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text("HOŞGELDİNİZ"),
                            Image.network(
                                "https://cdn.bolgegundem.com/d/other/2020/04/18/ikizler-ve-yukselen-ikizler-burcu-bwso-cover.jpg")
                          ],
                        ),
                      ),
                    ),
                    Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            " Boğa burcu olan kişiler hedefleri doğrultusunda ilerlerken tüm engelleri kararlı bir şekilde aşarlar."
                                " Yeteneklerini ön plana çıkaran boğa burçları maddecilikleri ile ön plana çıkarlar."
                                " Bireysel ilişkilerde ise son derece sözlerine güvenilir kişiler olarak bilinmektedir. "
                                "Para kazanmayı seven boğa burçları bu kapsamda çok çalışarak maddi güce erişmek için gece gündüz çalışırlar. "
                                "Bu yönleri ile çalışkanlıkları da ön plana çıkmış olur. ""Boğa burcu kişileri yatırım konusunda oldukça yetenekliler. "
                                "O nedenle doğru yatırımlarda bulunabilirler.  ",
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