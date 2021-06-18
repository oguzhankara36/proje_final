import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class basak extends StatefulWidget{
  sayfa15 createState() => sayfa15();
}
class sayfa15 extends State<basak>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("BAŞAK",
            style: TextStyle(color: Colors.black),),
        ),

        body: SingleChildScrollView(
          child: Column(
    children: <Widget>[
          Text(
            "BAŞAK BURÇ YORUMU",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          IntrinsicHeight(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        color: Colors.grey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text("HOŞGELDİNİZ"),
                            Image.network(
                                "https://listelist.com/wp-content/uploads/2018/07/başak-burcu-özellikleri4-e1531825280862.jpg")
                          ],
                        ),
                      ),
                    ),
                    Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            " Başak evresinde birey, aileye olan bağımlılığından kurtulmak için değerlerini saptama ve seçimlerini yapma aşamasına gelir"
                                "Buradaki temel fonksiyon muhakeme yeteneğidir. Muhakeme ederek, ayırımına vardığı, "
                                "özümsediği şeyleri bünyesine entegre edip, kendinden bir parça haline getiren Başak, "
                                "aileye olan bağımlılığından kurtularak, yaşamını devam ettirebilmek için çalışmak zorundadır. "
                                "Yani kendini, enerjilerini belli bir alana kanalize ederek, tüm detaylarıyla uzmanlaşmak durumundadır."
                                " Artık vücut ve ruhun birbirinden ayrılması ve farklılığın anlaşılması söz konusudur"
                                "Başak, eğer kendi içinde vücudu-ruhu ile uyum sağlayabilirse sağlığı da iyi olur. "
                                "Seçilen yiyecekler, giyim, egzersiz, eşlik eden insanlar bile sağlık durumunu etkileyebilir."
                                "Tüm yapılan seçimlerin birbiri ile uyum içinde olması gerekir. "
                                "Aynı zamanda vücudun ve ruhun bütün oldukları, uyumla, koordinasyon içinde yaşaması gerektiği benimsenmelidir.",
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