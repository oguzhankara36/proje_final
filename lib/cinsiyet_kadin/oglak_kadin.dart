import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'package:flutter/services.dart';
import 'package:animator/animator.dart';

class oglak_kadin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text('OĞLAK KADINI'),
        ),
        body: oglakk_kadin());
  }
}

class oglakk_kadin extends StatefulWidget {
  @override
  _oglakk_kadinState createState() => _oglakk_kadinState();
}

class _oglakk_kadinState extends State<oglakk_kadin> {
  var gelenyazi="";
  Artboard _artboard;
  RiveAnimationController _animasyonkontrol2;

  @override
  void initState() {
    _rivedosyasi();
    super.initState();
  }

  void _rivedosyasi() async {
    final oglakdosya = await rootBundle.load('assets/oglakkadın.riv');
    final oglakekle = RiveFile.import(oglakdosya);

    setState(() {
      _artboard = oglakekle.mainArtboard;
    });
  }

  void _animasyon2() async {
    _artboard.addController(
      _animasyonkontrol2 = SimpleAnimation('oglakkadın'),
    );
    setState(() => _animasyonkontrol2.isActive = true);
  }
  yazigetir() {
    FirebaseFirestore.instance.collection("burclar")
        .doc('oglakkadın').get().then((gelen) {
      setState(() {
        gelenyazi = gelen.data()['oglakkadın'];
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
          Animator(
            tween: Tween<double>(begin: 1,end: 0),
            builder:(context, state, child){
              return FractionalTranslation(translation: Offset(state.value, 0),
                child: child,
              );
            },
            child: FloatingActionButton
              (child: Icon(Icons.adjust),
                onPressed: ()
                {
                  yazigetir();
                  _animasyon2();
                }

            ),
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