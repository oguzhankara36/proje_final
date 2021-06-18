import 'package:firebase/cinsiyet_erkek/akrep_erkek.dart';
import 'package:firebase/cinsiyet_erkek/aslan_erkek.dart';
import 'package:firebase/cinsiyet_erkek/balik_erkek.dart';
import 'package:firebase/cinsiyet_erkek/basak_erkek.dart';
import 'package:firebase/cinsiyet_erkek/boga_erkek.dart';
import 'package:firebase/cinsiyet_erkek/ikizler_erkek.dart';
import 'package:firebase/cinsiyet_erkek/koc_erkek.dart';
import 'package:firebase/cinsiyet_erkek/kova_erkek.dart';
import 'package:firebase/cinsiyet_erkek/oglak_erkek.dart';
import 'package:firebase/cinsiyet_erkek/terazi_erkek.dart';
import 'package:firebase/cinsiyet_erkek/yay_erkek.dart';
import 'package:firebase/cinsiyet_erkek/yengec_erkek.dart';
import 'package:firebase/cinsiyet_kadin/akrep_kadin.dart';
import 'package:firebase/cinsiyet_kadin/aslan_kadin.dart';
import 'package:firebase/cinsiyet_kadin/balik_kadin.dart';
import 'package:firebase/cinsiyet_kadin/basak_kadin.dart';
import 'package:firebase/cinsiyet_kadin/boga_kadin.dart';
import 'package:firebase/cinsiyet_kadin/ikizler_kadin.dart';
import 'package:firebase/cinsiyet_kadin/koc_kadin.dart';
import 'package:firebase/cinsiyet_kadin/kova_kadin.dart';
import 'package:firebase/cinsiyet_kadin/oglak_kadin.dart';
import 'package:firebase/cinsiyet_kadin/terazi_kadin.dart';
import 'package:firebase/cinsiyet_kadin/yay_kadin.dart';
import 'package:firebase/cinsiyet_kadin/yengec_kadin.dart';
import 'package:firebase/diger_sayfalar/balik.dart';
import 'package:firebase/login_fancy/fancy.dart';
import 'package:flutter/material.dart';
import 'package:firebase/api/albums_models.dart';
import 'package:firebase/api/albums_services.dart';
import 'dart:math';
class AlbumsView extends StatefulWidget {
  @override
  _AlbumsViewState createState() => _AlbumsViewState();
}
class _AlbumsViewState extends State<AlbumsView> {
  Future<List<BurcListe>> futureData;
  @override
  void initState() {
    super.initState();
    futureData = fetchData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BURÇLAR '),
      ),
      body: Center(
        child: FutureBuilder<List<BurcListe>>(
          future: futureData,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<BurcListe> data = snapshot.data;
              return ListView.separated(
                itemCount: data.length,
                itemBuilder: (BuildContext context, int index)
                {

                  return ListTile(
                    leading: Icon(Icons.arrow_forward_sharp),
                        title: Text("  burç : " + data[index].burc.toString()),
                        subtitle: Text("   " + data[index].cinsiyet.toString()),
                        onTap: (){
                          if(data[index].burc=="balık" && data[index].cinsiyet == "erkek")
                          {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) => balik_erkek()));
                          }
                          if(data[index].burc=="balık" && data[index].cinsiyet == "kadın")
                          {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) => balik_kadin()));
                          }
                          if(data[index].burc=="akrep" && data[index].cinsiyet == "erkek")
                          {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) => akrep_erkek()));
                          }
                          if(data[index].burc=="akrep" && data[index].cinsiyet == "kadın")
                          {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) => akrep_kadin()));
                          }
                          if(data[index].burc=="aslan" && data[index].cinsiyet == "erkek")
                          {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) => aslan_erkek()));
                          }
                          if(data[index].burc=="aslan" && data[index].cinsiyet == "kadın")
                          {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) => aslan_kadin()));
                          }
                          if(data[index].burc=="başak" && data[index].cinsiyet == "erkek")
                          {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) => basak_erkek()));
                          }
                          if(data[index].burc=="başak" && data[index].cinsiyet == "kadın")
                          {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) => basak_kadin()));
                          }
                          if(data[index].burc=="boğa" && data[index].cinsiyet == "erkek")
                          {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) => boga_erkek()));
                          }
                          if(data[index].burc=="boğa" && data[index].cinsiyet == "kadın")
                          {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) => boga_kadin()));
                          }
                          if(data[index].burc=="ikizler" && data[index].cinsiyet == "erkek")
                          {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) => ikizler_erkek()));
                          }
                          if(data[index].burc=="ikizler" && data[index].cinsiyet == "kadın")
                          {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) => ikizler_kadin()));
                          }
                          if(data[index].burc=="koc" && data[index].cinsiyet == "erkek")
                          {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) => koc_erkek()));
                          }
                          if(data[index].burc=="koc" && data[index].cinsiyet == "kadın")
                          {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) => koc_kadin()));
                          }
                          if(data[index].burc=="kova" && data[index].cinsiyet == "erkek")
                          {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) => kova_erkek()));
                          }
                          if(data[index].burc=="kova" && data[index].cinsiyet == "kadın")
                          {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) => kova_kadin()));
                          }
                          if(data[index].burc=="oğlak" && data[index].cinsiyet == "erkek")
                          {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) => oglak_erkek()));
                          }
                          if(data[index].burc=="oğlak" && data[index].cinsiyet == "kadın")
                          {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) => oglak_kadin()));
                          }
                          if(data[index].burc=="terazi" && data[index].cinsiyet == "erkek")
                          {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) => terazi_erkek()));
                          }
                          if(data[index].burc=="terazi" && data[index].cinsiyet == "kadın")
                          {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) => terazi_kadin()));
                          }
                          if(data[index].burc=="yay" && data[index].cinsiyet == "erkek")
                          {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) => yay_erkek()));
                          }
                          if(data[index].burc=="yay" && data[index].cinsiyet == "kadın")
                          {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) => yay_kadin()));
                          }
                          if(data[index].burc=="yengeç" && data[index].cinsiyet == "erkek")
                          {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) => yengec_erkek()));
                          }
                          if(data[index].burc=="yengeç" && data[index].cinsiyet == "kadın")
                          {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) => yengec_kadin()));
                          }
                        },
                      );

                },

                separatorBuilder: (BuildContext context, int index)
                =>
                const Divider(),
              );
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }
// By default show a loading spinner.
            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}