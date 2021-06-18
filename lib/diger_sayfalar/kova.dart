import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class kova extends StatefulWidget{
  sayfa6 createState() => sayfa6();
}
class sayfa6 extends State<kova>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("KOVA",
            style: TextStyle(color: Colors.black),),
        ),

        body: Column(children: <Widget>[
          Text(
            "KOVA BURÇ YORUMU",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),


          IntrinsicHeight(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        color: Colors.pink,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text("HOŞGELDİNİZ"),
                            Image.network(
                                "https://blog.biletbayi.com/wp-content/uploads/2017/12/kova-burcu-scaled.jpg")
                          ],
                        ),
                      ),
                    ),
                    Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            " Özgürlüğüne düşkün olan kovaların sınırsız bir hayal güçleri vardır. "
                                "Akılcı ve sezgisel olan kovalar, hayal güçleri ile birlikte"
                                " bilim ve sanat alanlarında oldukça başarılı projelere imza atarlar."
                                " Bazen dik kafalı tavırları ile insanları kızdırsalar da bildiklerinden şaşmayan yapıları ile "
                                "şaşırtıcı sonuçlara ulaştıkları göz ardı edilemez. Kova burçları yardımsever, güler yüzlü ve sevgi dolu insanlardır. İnsanlar arasında ayrım yapmazlar herkesin aynı yaşam standartlarına sahip olmalarını isterler."
                                " İyi niyetli kovalar bazen inatçı davranırlar. Özgür ruhlarından ötürü aile yaşamında zorlanırlar. ",
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