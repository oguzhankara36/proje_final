import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class terazi extends StatefulWidget{
  sayfa5 createState() => sayfa5();
}
class sayfa5 extends State<terazi>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("TERAZİ",
            style: TextStyle(color: Colors.black),),
        ),

        body: Column(children: <Widget>[
          Text(
            "TERAZİ BURÇ YORUMU",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),


          IntrinsicHeight(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        color: Colors.lightBlue,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text("HOŞGELDİNİZ"),
                            Image.network(
                                "https://www.mardinlife.com/uploads/2021/03/terazi-burcu-nedir-terazi-burcu-tarihi-nedir-terazi-burcu-ozellikleri-nelerdir-55728.jpg?234234.234234")
                          ],
                        ),
                      ),
                    ),
                    Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "  Terazi burcu olan kişiler genellikle cazibeli ve çekici kişilerdir."
                                " Herkes tarafından çekici ve büyüleyici bulunurlar. "
                                "Keyifli ve enerji tavırları ile ön plana çıkan terazi burcu olan kişiler çevresindeki kişiler tarafından ilgi görürler. "
                                "Tartışmaktan kaçınmayan terazi burçları haklarını savunmaktan kaçınmazlar. "
                                "Mantıklı davranmaktan hoşlanan terazi burçları genel olarak doğru kararlar almaktan hoşlanır. "
                                "Aynı zamanda mücadeleyi seven terazi burçları uyumlu bir kişiliğe sahiplerdir. ",
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