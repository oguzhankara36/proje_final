import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class balik extends StatefulWidget{
  sayfa10 createState() => sayfa10();
}
class sayfa10 extends State<balik>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("BALIK",
            style: TextStyle(color: Colors.black),),
        ),

        body: SingleChildScrollView(
        child: Column(children: <Widget>[
          Text(
            "BALIK BURÇ YORUMU",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),


          IntrinsicHeight(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        color: Colors.deepOrange,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text("HOŞGELDİNİZ"),
                            Image.network(
                                "https://i1.wp.com/www.emrecaglaryildiz.com.tr/wp-content/uploads/2019/02/3EQWD3EWtısı.jpg?fit=617%2C369&ssl=1")
                          ],
                        ),
                      ),
                    ),
                    Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            " Balık burcu olan kişiler genel olarak sabırlı, eli açık ve de duyarlı olan insanlardır."
                                " Bu kişilerin her daim büyük bir inandırma yetenekleri bulunmaktadır. "
                                "Dürüst, sadık, vicdan sahibi ve de uysaldırlar. Her çevreye kolay bir şekilde ayak uydurabilirler. "
                                "Genellikle hayal dünyalarında yaşarlar. Hayat görüşleri ciddi ancak gerçekçi değildirler. "
                                "Balık burcu olan kişiler diğer burçlar arasında bulunan dış etkenlerden en fazla etkilenen kişilerdir. "
                                "Hayal dünyasında çok mutlu olurlar. Ama zannedilenden daha akıllı ve de kurnaz olurlar. "
                                "Sinirli olan yapısını gizli bir sakinlik ile örten balık burcu herkesin seçtiği özel kişi olmanın hayallerini kurar. "
                                "Yaşam onlar için genelde ürkütücü ve korkunçtur.  ",
                          ),
                        ]
                    ),
                  ]

              )

          )

        ])
        )
    );
  }
}
