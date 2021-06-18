import 'package:firebase/api/albums_models.dart';
import 'package:firebase/sqlite/burcsqlite.dart';
import 'package:firebase/sqlite/vt_yardimci.dart';
import 'package:flutter/material.dart';

class VtAnasayfa extends StatefulWidget {
  @override
  _VtAnasayfaState createState() => _VtAnasayfaState();
}

class _VtAnasayfaState extends State<VtAnasayfa> {
  VtYardimcisi vtYardimcisi = new VtYardimcisi();
  List<burcsqlite> burclar = new List();
  bool duzenlemi = false;
  final formKontrolcu = GlobalKey<FormState>();

  final burckntrl = TextEditingController();
  final cinsiyetkntrl = TextEditingController();
  final aykntrl = TextEditingController();

  _ogrenciEkle() {
    vtYardimcisi
        .ogrenciKaydet(
            new burcsqlite(burckntrl.text, cinsiyetkntrl.text, aykntrl.text))
        .then((deger) {
      debugPrint(deger.toString());
      if (deger > 0) {
        listeYenile();
        burckntrl.clear();
        cinsiyetkntrl.clear();
        aykntrl.clear();
        Navigator.pop(context);
      }
    });
  }

  _ogrenciSil(burcsqlite burc) {
    vtYardimcisi.ogrenciSil(burc).then((cvp) {
      if (cvp > 0) {
        listeYenile();
      }
    });
  }

  _ogrenciGuncelle(int bno) {
    var brc = new burcsqlite(burckntrl.text, cinsiyetkntrl.text, aykntrl.text);
    brc.no = bno;
    vtYardimcisi.ogrenciGuncelle(brc).then((cvp) {
      if (cvp) {
        debugPrint(cvp.toString());
        listeYenile();
        Navigator.pop(context);
      }
    });
  }

  @override
  void initState() {
    super.initState();
    listeYenile();
  }

  listeYenile() {
    vtYardimcisi.ogrencileriGetir().then((gelen) {
      setState(() {
        burclar = gelen;
      });
      debugPrint(gelen.toString());
    });
  }

  void eklemeEkraniAc({burcsqlite burcs}) {
    if (burcs != null) {
      duzenlemi = true;
      burckntrl.text = burcs.burcadi;
      cinsiyetkntrl.text = burcs.cinsiyet;
      aykntrl.text = burcs.ay;
    } else {
      duzenlemi = false;
      cinsiyetkntrl.clear();
      burckntrl.clear();
      aykntrl.clear();
    }
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return AlertDialog(
            title: Text(duzenlemi ? "burç düzenle" : "burç ekle"),
            content: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Form(
                    key: formKontrolcu,
                    child: Column(
                      children: <Widget>[
                        TextFormField(
                          validator: (val) {
                            if (val.length > 0) {
                              return "lütfen burayı boş bırakmayın";
                            }
                            return "sorun yok";
                          },
                          controller: burckntrl,
                          decoration: InputDecoration(
                            hintText: "burç adını girin",
                          ),
                        ),
                        TextFormField(
                          validator: (val) {
                            if (val.length > 0) {
                              return "lütfen burayı boş bırakmayın";
                            }
                            return "sorun yok";
                          },
                          controller: cinsiyetkntrl,
                          decoration: InputDecoration(
                            hintText: "Cinsiyeti Giriniz",
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            actions: <Widget>[
              FlatButton(
                onPressed: () =>
                    duzenlemi ? _ogrenciGuncelle(burcs.no) : _ogrenciEkle(),
                child: Text(duzenlemi ? "Düzenle" : "Ekle"),
              ),
              FlatButton(
                onPressed: () => Navigator.pop(context),
                child: Text("İptal"),
              )
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Burçlar SQLİTE"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.plus_one),
            onPressed: () => eklemeEkraniAc(),
          )
        ],
      ),
      body: ListView.builder(
        itemCount: burclar.length,
        itemBuilder: (BuildContext baglan, int sira) {
          return Card(
            child: Column(
              children: <Widget>[
                ListTile(
                  title: Text(
                      "${burclar[sira].burcadi} ${burclar[sira].cinsiyet}"),
                  leading: Text("${burclar[sira].no}"),
                ),
                Row(
                  children: <Widget>[
                    FlatButton(
                      onPressed: () => eklemeEkraniAc(burcs: burclar[sira]),
                      child: Text("Güncelle"),
                    ),
                    FlatButton(
                      onPressed: () => _ogrenciSil(burclar[sira]),
                      child: Text("Sil"),
                    ),
                  ],
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
