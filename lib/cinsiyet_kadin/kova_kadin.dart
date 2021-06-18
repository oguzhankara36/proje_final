import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'package:flutter/services.dart';
import 'package:animator/animator.dart';

class kova_kadin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text('KOVA KADINI'),
        ),
        body: kovaa_kadin());
  }
}

class kovaa_kadin extends StatefulWidget {
  @override
  _kovaa_kadinState createState() => _kovaa_kadinState();
}

class _kovaa_kadinState extends State<kovaa_kadin> {
  var gelenyazi="";
  Artboard _artboard;
  RiveAnimationController _animasyonkontrol2;

  @override
  void initState() {
    _rivedosyasi();
    super.initState();
  }

  void _rivedosyasi() async {
    final kovadosya = await rootBundle.load('assets/kovakadın.riv');
    final kovaekle = RiveFile.import(kovadosya);

    setState(() {
      _artboard = kovaekle.mainArtboard;
    });
  }

  void _animasyon2() async {
    _artboard.addController(
      _animasyonkontrol2 = SimpleAnimation('kovakadın'),
    );
    setState(() => _animasyonkontrol2.isActive = true);
  }
  yazigetir() {
    FirebaseFirestore.instance.collection("burclar")
        .doc('kovakadın').get().then((gelen) {
      setState(() {
        gelenyazi = gelen.data()['kovakadın'];
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