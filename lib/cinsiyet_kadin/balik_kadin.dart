import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'package:flutter/services.dart';

class balik_kadin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text('BALIK KADINI'),
        ),
        body: balikk_kadin());
  }
}

class balikk_kadin extends StatefulWidget {
  @override
  _balikk_kadinState createState() => _balikk_kadinState();
}

class _balikk_kadinState extends State<balikk_kadin> {
  var gelenyazi="";
  Artboard _artboard;
  RiveAnimationController _animasyonkontrol2;

  @override
  void initState() {
    _rivedosyasi();
    super.initState();
  }

  void _rivedosyasi() async {
    final balikdosya = await rootBundle.load('assets/balik_kadin.riv');
    final balikekle = RiveFile.import(balikdosya);

    setState(() {
      _artboard = balikekle.mainArtboard;
    });
  }

  void _animasyon2() async {
    _artboard.addController(
      _animasyonkontrol2 = SimpleAnimation('balik_kadin'),
    );
    setState(() => _animasyonkontrol2.isActive = true);
  }
  yazigetir() {
    FirebaseFirestore.instance.collection("burclar")
        .doc('balıkkadın').get().then((gelen) {
      setState(() {
        gelenyazi = gelen.data()['balikkadin'];
      });
    }
    );
  }

  @override
  Widget build(BuildContext context) {

    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height - 250,
              child: _artboard != null
                  ? Rive(
                artboard: _artboard,
                fit: BoxFit.cover,
              )
                  : Container()),
          FloatingActionButton
            (child: Icon(Icons.adjust),
              onPressed: ()
              {
                yazigetir();
                _animasyon2();
              }

          ),
          Column(
            children: [
              Text(gelenyazi.toString(),style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              )],
          )
        ],
      ),
    );
  }
}