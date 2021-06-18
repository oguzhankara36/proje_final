import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class aslan extends StatefulWidget{
  sayfa14 createState() => sayfa14();
}
class sayfa14 extends State<aslan>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("ASLAN",
            style: TextStyle(color: Colors.black),),
        ),

        body: Column(children: <Widget>[
          Text(
            "ASLAN BURÇ YORUMU",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),


          IntrinsicHeight(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        color: Colors.black12,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text("HOŞGELDİNİZ"),
                            Image.network(
                                "https://www.oncevatan.com.tr/images/resize/70/652x400/haberler/2021/01/2021_aslan_burcu_h162468_f94a7.jpg")
                          ],
                        ),
                      ),
                    ),
                    Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            " Aslan burcu olan kişiler genel olarak önderdir. Başkalarının yaşantılarını bile onlar adına düzenlemek ister. "
                                "Her şeye karışırlar ve de kibirlidirler."
                                " Bu nedenle onları anlatan sözcük 'Yönetirim' şeklindedir. "
                                "Yaşam sahnesinde her daim parlayarak, odak noktası haline gelmek isterler."
                                "Organizasyon güçleri çok gelişmiştir. İsteklerini herkese kabul ettirmek, onlar adına yaşamlarının 'olmazsa olmaz' şartı olmaktadır. "
                                "İyi zamanlarında etkileyici ve güler yüzlü olurlar. "
                                "Aslan burcu olan kişiler başkalarına yardım etmeyi severler ve bunu kendilerine görev sayarlar. "
                                "Aslan burcu olan kişiler sevimli ve de iyimser kişilerdir. ",
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