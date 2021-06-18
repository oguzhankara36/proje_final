import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'package:flutter/services.dart';
import 'package:animator/animator.dart';

class terazi_erkek extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text('TERAZİ ERKEĞİ'),
        ),
        body: terazii_erkek());
  }
}

class terazii_erkek extends StatefulWidget {
  @override
  _terazii_erkekState createState() => _terazii_erkekState();
}

class _terazii_erkekState extends State<terazii_erkek> {
  var gelenyazi="";
  Artboard _artboard;
  RiveAnimationController _animasyonkontrol2;

  @override
  void initState() {
    _rivedosyasi();
    super.initState();
  }

  void _rivedosyasi() async {
    final terazidosya = await rootBundle.load('assets/terazierkek.riv');
    final teraziekle = RiveFile.import(terazidosya);

    setState(() {
      _artboard = teraziekle.mainArtboard;
    });
  }

  void _animasyon2() async {
    _artboard.addController(
      _animasyonkontrol2 = SimpleAnimation('terazierkek'),
    );
    setState(() => _animasyonkontrol2.isActive = true);
  }
  yazigetir() {
    FirebaseFirestore.instance.collection("burclar")
        .doc('terazierkek').get().then((gelen) {
      setState(() {
        gelenyazi = gelen.data()['terazierkek'];
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