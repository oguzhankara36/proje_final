import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class yay extends StatefulWidget{
  sayfa8 createState() => sayfa8();
}
class sayfa8 extends State<yay>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("YAY",
            style: TextStyle(color: Colors.black),),
        ),

        body: Column(children: <Widget>[
          Text(
            "YAY BURÇ YORUMU",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),


          IntrinsicHeight(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        color: Colors.green,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text("HOŞGELDİNİZ"),
                            Image.network(
                                "https://www.mardinlife.com/uploads/2021/03/yay-burcu-nedir-yay-burcu-tarihi-nedir-yay-burcu-ozellikleri-nelerdir-55746.jpg")
                          ],
                        ),
                      ),
                    ),
                    Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            " Gençlik çağlarında heyecanlı, bazen dikkatsiz hareket edebilen kişilerdir. "
                                "Bununla birlikte geçmişten ders çıkarabilmek ise en önemli kişisel özellikleri arasında öne çıkar. "
                                "Mantıklı hareket etmekten hoşlanırlar. Kavrama yetenekleri oldukça gelişmiştir. "
                                "Her el attıkları işte pratik zekaları ve becerikli yapılarıyla başarıya ulaşırlar. "
                                "İyimser yaşam felsefeleri ile çevrelerindeki insanlara ışık tutarlar. "
                                "Bazen fevri ve patavatsız söz ve hareketleri ile şaşırtabilirler. "
                                "Bilinmeyenlere merakı onu araştırmaya yönlendirir. Çok yönlü yaylar, aynı anda birkaç şey ile ilgilenebilirler. ",
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
